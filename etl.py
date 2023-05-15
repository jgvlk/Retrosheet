from datetime import datetime as dt
import os
from pathlib import Path
import requests
import shutil
import subprocess
import sys
import time

import pandas as pd

from db.repository import exec_bulk_insert, exec_sql_file


class RetrosheetEtl:
    def __init__(
        self,
        download=False,
        process=True,
        data_dir=Path("C:/Data/Retrosheet"),
        repo_dir=Path("C:/repos/Retrosheet"),
    ):
        self.data_dir = data_dir
        self.repo_dir = repo_dir
        self.run_dir = self.data_dir / "run"
        self.download = download
        self.process = process

        self.game_cols_file = self.repo_dir / "data" / "metadata" / "game_fields.csv"
        self.event_cols_file = self.repo_dir / "data" / "metadata" / "event_fields.csv"
        self.supp_data_dir = self.repo_dir / "data" / "supplemental"
        self.reg_games_dir = self.data_dir / "run" / "game" / "reg"
        self.reg_events_dir = self.data_dir / "run" / "event" / "reg"
        self.post_games_dir = self.data_dir / "run/game/post"
        self.as_games_dir = self.data_dir / "run/game/as"
        self.post_events_dir = self.data_dir / "run/event/post"
        self.as_events_dir = self.data_dir / "run/event/as"
        self.game_all_path = self.data_dir / "game_all.csv"
        self.event_all_path = self.data_dir / "event_all.csv"

        self.url_biofile = "https://www.retrosheet.org/BIOFILE.TXT"
        self.url_teamabbr = "https://www.retrosheet.org/TEAMABR.TXT"
        self.url_parkcodes = "https://www.retrosheet.org/parkcode.txt"
        self.url_currentname = "https://www.retrosheet.org/CurrentNames.csv"

        self.biofile_path = self.supp_data_dir / "bio_file.csv"
        self.teamabbr_path = self.supp_data_dir / "team_abbr.csv"
        self.parkcodes_path = self.supp_data_dir / "park_code.csv"
        self.franchise_path = self.supp_data_dir / "current_name.csv"

        self.downloader_script_path = self.repo_dir / "scripts" / "downloader.ps1"
        self.processer_script_path = self.repo_dir / "scripts" / "processer.ps1"
        self.cleaner = self.repo_dir / "scripts" / "cleaner.ps1"

        self.sql_dir = self.repo_dir / "sql"
        self.sql_etld = {
            "sql_path_drop_fks": self.sql_dir / "__ETL_Retrosheet__DropFKs.sql",
            "sql_path_truncate_tables": self.sql_dir
            / "__ETL_Retrosheet__TruncateTables.sql",
            "sql_path_raw_to_stg": self.sql_dir / "__ETL_Retrosheet__RawToStg.sql",
            "sql_path_stg_to_dbo": self.sql_dir / "__ETL_Retrosheet__StgToDbo.sql",
            "sql_path_add_fks": self.sql_dir / "__ETL_Retrosheet__AddFKs.sql",
            "sql_path_load_game_type": self.sql_dir
            / "__ETL_Retrosheet__LoadGameType.sql",
        }

        if self.data_dir.exists():
            pass
        else:
            os.mkdir(self.data_dir)

        if self.run_dir.exists():
            pass
        else:
            os.mkdir(self.run_dir)

    def load_retro_data(self):
        game_cols_data = pd.read_csv(self.game_cols_file)
        event_cols_data = pd.read_csv(self.event_cols_file)
        game_cols = []
        for i in game_cols_data["ColumnName"]:
            game_cols.append(i)
        event_cols = []
        for i in event_cols_data["ColumnName"]:
            event_cols.append(i)

        dfs_game = []
        for i in self.reg_games_dir.glob("game*"):
            df = pd.read_csv(i, encoding="utf-16", names=game_cols)
            df["GameType"] = "Regular Season"
            dfs_game.append(df)
        for i in self.post_games_dir.glob("game*"):
            df = pd.read_csv(i, encoding="utf-16", names=game_cols)
            df["GameType"] = "Postseason"
            dfs_game.append(df)
        for i in self.as_games_dir.glob("game*"):
            df = pd.read_csv(i, encoding="utf-16", names=game_cols)
            df["GameType"] = "All-Star"
            dfs_game.append(df)
        df_game = pd.concat(dfs_game)
        df_game.to_csv(self.game_all_path, index=False)

        dfs_event = []
        for i in self.reg_events_dir.glob("event*"):
            df = pd.read_csv(i, encoding="utf-16", names=event_cols)
            dfs_event.append(df)
        for i in self.post_events_dir.glob("event*"):
            df = pd.read_csv(i, encoding="utf-16", names=event_cols)
            dfs_event.append(df)
        for i in self.as_events_dir.glob("event*"):
            try:
                df = pd.read_csv(i, encoding="utf-16", names=event_cols)
                dfs_event.append(df)
            except:
                print(
                    "|| ERR @ {} || ERROR LOADING EVENT FILE FROM .csv: {}".format(
                        dt.now(), i
                    )
                )
                continue
        df_event = pd.concat(dfs_event)
        df_event.to_csv(self.event_all_path, index=False)

        exec_bulk_insert("raw", "Game", self.game_all_path)
        exec_bulk_insert("raw", "Event", self.event_all_path)

    def fetch_supp_retro_data(self):
        response = requests.get(self.url_biofile)
        with open(self.biofile_path, "w") as f:
            f.write(response.text)
            f.close()

        response = requests.get(self.url_teamabbr)
        with open(self.teamabbr_path, "w") as f:
            f.write(response.text)
            f.close()

        response = requests.get(self.url_parkcodes)
        with open(self.parkcodes_path, "w") as f:
            f.write(response.text)
            f.close()

        response = requests.get(self.url_currentname)
        current_name_cols = [
            "CurrentFranchiseID",
            "FranchiseID",
            "League",
            "Division",
            "LocationName",
            "Nickname",
            "AltNicknames",
            "Start",
            "End",
            "City",
            "State",
        ]
        with open(self.franchise_path, "w") as f:
            f.write(response.text)
            f.close()

        df_biofile = pd.read_csv(self.biofile_path)
        new_biofile_cols = []
        for i in df_biofile.columns:
            new_col_name = i.replace(" ", "_")
            new_biofile_cols.append(new_col_name)
        df_biofile.columns = new_biofile_cols
        df_teamabbr = pd.read_csv(
            self.teamabbr_path,
            keep_default_na=False,
            names=["TeamAbbr", "League", "City", "Nickname", "Start", "End"],
        )
        df_parkcodes = pd.read_csv(self.parkcodes_path)
        df_currentname = pd.read_csv(self.franchise_path, names=current_name_cols)

        df_biofile.to_csv(self.biofile_path, index=False)
        df_teamabbr.to_csv(self.teamabbr_path, index=False)
        df_parkcodes.to_csv(self.parkcodes_path, index=False)
        df_currentname.to_csv(self.franchise_path, index=False)

    def load_supp_retro_data(self):
        exec_bulk_insert("raw", "PlayerMaster", self.biofile_path.absolute())
        exec_bulk_insert("raw", "TeamMaster", self.teamabbr_path.absolute())
        exec_bulk_insert("raw", "ParkMaster", self.parkcodes_path.absolute())
        exec_bulk_insert("raw", "FranchiseMaster", self.franchise_path.absolute())

    def execute(self):
        start = time.time()
        print("|| MSG @ {} || RETROSHEET ETL PROCESSING STARTED".format(dt.now()))
        print("|| MSG @ {} || DROPPING FKs FROM [dbo]".format(dt.now()))
        _ = exec_sql_file(self.sql_etld["sql_path_drop_fks"])
        print("|| MSG @ {} || TRUCATING [Retrosheet] TABLES".format(dt.now()))
        _ = exec_sql_file(self.sql_etld["sql_path_truncate_tables"])
        print("|| MSG @ {} || LOADING [dbo].[GameType]".format(dt.now()))
        _ = exec_sql_file(self.sql_etld["sql_path_load_game_type"])
        if self.download:
            print("|| MSG @ {} || DOWNLOADING RETROSHEET DATA".format(dt.now()))
            downloader = subprocess.Popen(
                [
                    "powershell.exe",
                    self.downloader_script_path,
                    str(self.data_dir),
                ],
                stdout=sys.stdout,
            )
            downloader.communicate()
        print("|| MSG @ {} || PROCESSING DOWNLOADED RETROSHEET DATA".format(dt.now()))
        if self.process:
            processer = subprocess.Popen(
                [
                    "powershell.exe",
                    self.processer_script_path,
                    str(self.data_dir),
                ],
                stdout=sys.stdout,
            )
            processer.communicate()
        print("|| MSG @ {} || FETCHING SUPP RETROSHEET DATA".format(dt.now()))
        _ = self.fetch_supp_retro_data()
        _ = self.load_supp_retro_data()
        print("|| MSG @ {} || LOADING RAW GAME AND EVENT DATA".format(dt.now()))
        _ = self.load_retro_data()
        print("|| MSG @ {} || STAGING GAME AND EVENT DATA".format(dt.now()))
        _ = exec_sql_file(self.sql_etld["sql_path_raw_to_stg"])
        print("|| MSG @ {} || WRITING GAME AND EVENT DATA TO [dbo]".format(dt.now()))
        _ = exec_sql_file(self.sql_etld["sql_path_stg_to_dbo"])
        print("|| MSG @ {} || ADDING FKs TO [dbo]".format(dt.now()))
        _ = exec_sql_file(self.sql_etld["sql_path_add_fks"])
        end = time.time()
        run_time = round((end - start) / 60, 1)
        print(
            "|| MSG @ {} || RETROSHEET ETL COMPLETED. RUNTIME: {} min".format(
                dt.now(), run_time
            )
        )


if __name__ == "__main__":
    _retl = RetrosheetEtl(download=False, process=True)
    os.chdir(_retl.run_dir)
    _retl.execute()
    os.chdir(_retl.data_dir)
    shutil.rmtree(_retl.run_dir)
