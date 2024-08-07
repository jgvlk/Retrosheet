from datetime import datetime as dt
import os
from pathlib import Path
import requests
import shutil
import subprocess
import time
import zipfile

import pandas as pd

from db.repository import exec_bulk_insert, exec_sql_file


class RetrosheetEtl:
    def __init__(
        self,
        data_dir: Path = Path("C:/Data/Retrosheet_2023"),
        repo_dir: Path = Path("C:/repos/Retrosheet"),
    ) -> None:
        self.data_dir: Path = data_dir
        self.repo_dir: Path = repo_dir
        self.download_dir: Path = self.data_dir / "download"
        self.extract_dir: Path = self.data_dir / "extract"
        self.log_dir: Path = self.data_dir / "log"
        self.output_dir: Path = self.data_dir / "output"
        self.run_dir: Path = self.data_dir / "run"

        self.allas_dir: Path = self.extract_dir / "allstar"
        self.boxes_dir: Path = self.extract_dir / "boxes"
        self.discrepancies_dir: Path = self.extract_dir / "discrepancies"
        self.events_dir: Path = self.extract_dir / "events"
        self.gamelogs_dir: Path = self.extract_dir / "gamelogs"
        self.ngldata_dir: Path = self.extract_dir / "Negro Leagues"
        self.allpost_dir: Path = self.extract_dir / "postseason"
        self.rosters_dir: Path = self.extract_dir / "rosters"
        self.schedule_dir: Path = self.extract_dir / "schedules"
        self.teams_dir: Path = self.extract_dir / "teams"
        self.ngldata_events_dir: Path = self.ngldata_dir / "events"

        self.all_data_zip: Path = self.download_dir / "alldata.zip"
        self.franchise_master_file: Path = self.download_dir / "franchises.csv"
        self.ballparks_file: Path = self.extract_dir / "ballparks.csv"
        self.bio_file: Path = self.extract_dir / "biofile.csv"
        self.coaches_file: Path = self.extract_dir / "coaches.csv"
        self.ejections_file: Path = self.extract_dir / "ejections.csv"
        self.relatives_file: Path = self.extract_dir / "relatives.csv"
        self.teams_file: Path = self.extract_dir / "teams.csv"
        self.game_cols_file: Path = self.repo_dir / "data" / "game_fields.csv"
        self.event_cols_file: Path = self.repo_dir / "data" / "event_fields.csv"
        self.game_all_file: Path = self.output_dir / "game_all.csv"
        self.event_all_file: Path = self.output_dir / "event_all.csv"

        now = dt.now()
        self.game_log_file: Path = self.log_dir / "game_proc_{}.log".format(
            now.strftime(r"%Y%m%d%H%M%S")
        )
        self.event_log_file: Path = self.log_dir / "event_proc_{}.log".format(
            now.strftime(r"%Y%m%d%H%M%S")
        )

        self.game_output_dir: Path = self.output_dir / "game"
        self.event_output_dir: Path = self.output_dir / "event"

        self.file_extensions: list = [
            ".EDA",
            ".EDN",
            ".EVA",
            ".EVE",
            ".EVF",
            ".EVN",
            ".EVR",
        ]

        self.url_all_data: str = "https://www.retrosheet.org/downloads/alldata.zip"
        self.url_currentname: str = "https://www.retrosheet.org/CurrentNames.csv"

        self.sql_dir: Path = self.repo_dir / "sql"

        self.sql_d: dict = {
            "ddl": {
                "cs_raw": self.sql_dir / "ddl" / "raw" / "raw.sql",
                "ct_raw_discrepancy": self.sql_dir / "ddl" / "raw" / "raw.Discrepancy.sql",
                "ct_raw_ejection": self.sql_dir / "ddl" / "raw" / "raw.Ejection.sql",
                "ct_raw_event": self.sql_dir / "ddl" / "raw" / "raw.Event.sql",
                "ct_raw_franchise_master": self.sql_dir
                / "ddl"
                / "raw"
                / "raw.FranchiseMaster.sql",
                "ct_raw_game": self.sql_dir / "ddl" / "raw" / "raw.Game.sql",
                "ct_raw_gamelog": self.sql_dir / "ddl" / "raw" / "raw.GameLog.sql",
                "ct_raw_park_master": self.sql_dir
                / "ddl"
                / "raw"
                / "raw.ParkMaster.sql",
                "ct_raw_player_master": self.sql_dir
                / "ddl"
                / "raw"
                / "raw.PlayerMaster.sql",
                "ct_raw_schedule": self.sql_dir / "ddl" / "raw" / "raw.Schedule.sql",
                "ct_raw_team_master": self.sql_dir
                / "ddl"
                / "raw"
                / "raw.TeamMaster.sql",
                "ct_dbo_discrepancy": self.sql_dir
                / "ddl"
                / "dbo"
                / "dbo.Discrepancy.sql",
                "ct_dbo_ejection": self.sql_dir / "ddl" / "dbo" / "dbo.Ejection.sql",
                "ct_dbo_event": self.sql_dir / "ddl" / "dbo" / "dbo.Event.sql",
                "ct_dbo_franchise_master": self.sql_dir
                / "ddl"
                / "dbo"
                / "dbo.FranchiseMaster.sql",
                "ct_dbo_game": self.sql_dir / "ddl" / "dbo" / "dbo.Game.sql",
                "ct_dbo_gamelog": self.sql_dir / "ddl" / "dbo" / "dbo.GameLog.sql",
                "ct_dbo_park_master": self.sql_dir
                / "ddl"
                / "dbo"
                / "dbo.ParkMaster.sql",
                "ct_dbo_player_master": self.sql_dir
                / "ddl"
                / "dbo"
                / "dbo.PlayerMaster.sql",
                "ct_dbo_schedule": self.sql_dir / "ddl" / "dbo" / "dbo.Schedule.sql",
                "ct_dbo_team_master": self.sql_dir
                / "ddl"
                / "dbo"
                / "dbo.TeamMaster.sql",
            },
            "etl": {
                "etl_00_raw_data_corrections": self.sql_dir
                / "etl"
                / "__ETL_00__RawDataCorrections.sql",
                "etl_01_drop_fks": self.sql_dir / "etl" / "__ETL_01__DropFKs.sql",
                "etl_02_load_franchise_master": self.sql_dir
                / "etl"
                / "__ETL_02__LoadFranchiseMaster.sql",
                "etl_03_load_park_master": self.sql_dir
                / "etl"
                / "__ETL_03__LoadParkMaster.sql",
                "etl_04_load_player_master": self.sql_dir
                / "etl"
                / "__ETL_04__LoadPlayerMaster.sql",
                "etl_05_load_team_master": self.sql_dir
                / "etl"
                / "__ETL_05__LoadTeamMaster.sql",
                "etl_06_load_game": self.sql_dir / "etl" / "__ETL_06__LoadGame.sql",
                "etl_07_load_event": self.sql_dir / "etl" / "__ETL_07__LoadEvent.sql",
                "etl_08_load_ejection": self.sql_dir
                / "etl"
                / "__ETL_08__LoadEjection.sql",
                "etl_09_load_schedule": self.sql_dir
                / "etl"
                / "__ETL_09__LoadSchedule.sql",
                "etl_10_load_gamelog": self.sql_dir
                / "etl"
                / "__ETL_10__LoadGameLog.sql",
                # "etl_11_load_discrepancy": self.sql_dir / "etl" / "__ETL_11__LoadDiscrepancy.sql",
                "etl_12_add_fks": self.sql_dir / "etl" / "__ETL_12__AddFKs.sql",
                "etl_13_db_cleanup": self.sql_dir
                / "etl"
                / "__ETL_13__PostEtlDbCleanup.sql",
            },
        }

    def _concat_event_data(self) -> None:
        print("|| MSG @ {} || CONCATENATING EVENT DATA TO SINGLE FILE".format(dt.now()))
        dfs_event = []
        for i in self.event_output_dir.glob("event*"):
            try:
                df = pd.read_csv(
                    i,
                    encoding="ascii",
                    header=None,
                    dtype={i: str for i in range(0, 97)},
                )
                df["SourceFile"] = str(i.name)
                dfs_event.append(df)
            except Exception as e:
                print(
                    "|| ERR @ {} || ERROR CONCATENATING EVENT DATA: {}".format(
                        dt.now(), i
                    )
                )
                print("|| ERR @ {} || {}".format(dt.now(), e))
        df_event = pd.concat(dfs_event)
        df_event.to_csv(self.event_all_file, index=False, header=None)
        return None

    def _concat_game_data(self) -> None:
        print("|| MSG @ {} || CONCATENATING GAME DATA TO SINGLE FILE".format(dt.now()))
        dfs_game = []
        for i in self.game_output_dir.glob("game*"):
            try:
                df = pd.read_csv(
                    i,
                    encoding="ascii",
                    header=None,
                    dtype={i: str for i in range(0, 86)},
                )
                df["SourceFile"] = str(i.name)
                dfs_game.append(df)
            except Exception as e:
                print(
                    "|| ERR @ {} || ERROR CONCATENATING GAME DATA: {}".format(
                        dt.now(), i
                    )
                )
                print("|| ERR @ {} || {}".format(dt.now(), e))
        df_game = pd.concat(dfs_game)
        df_game.to_csv(self.game_all_file, index=False, header=None)
        return None

    def _db_setup(self) -> None:
        for i in self.sql_d["ddl"]:
            _ = exec_sql_file(self.sql_d["ddl"][i])
        return None

    def _download_source_data(self) -> None:
        print(
            "|| MSG @ {} || DOWNLOADING SOURE DATA FROM https://www.retrosheet.org/".format(
                dt.now()
            )
        )
        all_data = requests.get(self.url_all_data)
        with open(self.all_data_zip, "wb") as f:
            f.write(all_data.content)
        franchise_master_data = requests.get(self.url_currentname)
        with open(self.franchise_master_file, "w") as f:
            f.write(franchise_master_data.text)
        return None

    def _extract_source_data(self) -> None:
        print(
            "|| MSG @ {} || EXTRACTING SOURE DATA FROM https://www.retrosheet.org/".format(
                dt.now()
            )
        )
        _ = self._unzip(self.all_data_zip, self.extract_dir)
        for i in self.extract_dir.glob("*.zip"):
            extract_dir = self.extract_dir / i.name.replace(".zip", "")
            _ = self._unzip(i, extract_dir, remove=True)
        for i in self.ngldata_dir.glob("*.zip"):
            extract_dir = self.ngldata_dir / i.name.replace(".zip", "")
            _ = self._unzip(i, extract_dir, remove=True)
        return None

    def _mkdir(self, path: Path) -> None:
        if path.exists():
            pass
        else:
            os.mkdir(path)
        return None

    def _load_dbo(self):
        print("|| MSG @ {} || LOADING RAW DATA TO [dbo]".format(dt.now()))
        for i in self.sql_d["etl"]:
            print("|| MSG @ {} || RUNNING {}".format(dt.now(), self.sql_d["etl"][i]))
            _ = exec_sql_file(self.sql_d["etl"][i])
        return None

    def _load_retro_discrepancy_data(self) -> None:
        print("|| MSG @ {} || LOADING DISCREPANCY DATA".format(dt.now()))
        for i in self.discrepancies_dir.iterdir():
            try:
                df = pd.read_csv(i)
                df = df.drop("Unnamed: 12", axis=1)
                df["SourceFile"] = i.name
                df.to_csv(i, index=False)
                _ = exec_bulk_insert("raw", "Discrepancy", i, 2)
            except Exception as e:
                print(
                    "|| ERR @ {} || ERROR LOADING DISCREPANCY DATA: {}".format(
                        dt.now(), i
                    )
                )
                print("|| ERR @ {} || {}".format(dt.now(), e))
        return None

    def _load_retro_game_event_data(self) -> None:
        _ = self._mkdir(self.run_dir)
        os.chdir(self.run_dir)
        print("|| MSG @ {} || PROCESSING RETROSHEET 'allstar', 'postseason', 'events' DATA".format(dt.now()))
        for i in self.allas_dir.iterdir():
            dest_file = self.run_dir / i.name
            shutil.copy(i, dest_file)
        for i in self.allpost_dir.iterdir():
            dest_file = self.run_dir / i.name
            shutil.copy(i, dest_file)
        for i in self.events_dir.iterdir():
            dest_file = self.run_dir / i.name
            shutil.copy(i, dest_file)
        for i in self.ngldata_events_dir.iterdir():
            dest_file = self.run_dir / i.name
            shutil.copy(i, dest_file)
        for i in self.rosters_dir.iterdir():
            dest_file = self.run_dir / i.name
            shutil.copy(i, dest_file)
        for i in self.teams_dir.iterdir():
            dest_file = self.run_dir / i.name
            shutil.copy(i, dest_file)
        for i in self.run_dir.glob(r"**/*"):
            if i.suffix in self.file_extensions:
                _ = self._proc_retro_event_file(i)
        os.chdir(self.data_dir)
        _ = self._rmdir(self.run_dir)
        _ = self._concat_game_data()
        _ = self._concat_event_data()
        _ = self._to_sql_raw_game()
        _ = self._to_sql_raw_event()
        return None

    def _load_retro_gamelog_data(self) -> None:
        print("|| MSG @ {} || LOADING GAMELOG DATA".format(dt.now()))
        for i in self.gamelogs_dir.iterdir():
            df = pd.read_csv(i, encoding="ascii", header=None)
            df["SourceFile"] = i.name
            df.to_csv(i, index=False, header=None)
            _ = exec_bulk_insert("raw", "GameLog", i, 1)
        return None

    def _load_retro_lookup_data(self) -> None:
        _ = self._to_sql_raw_ejection()
        _ = self._to_sql_raw_franchise_master()
        _ = self._to_sql_raw_park_master()
        _ = self._to_sql_raw_player_master()
        _ = self._to_sql_raw_team_master()
        return None

    def _load_retro_schedule_data(self) -> None:
        print("|| MSG @ {} || LOADING SCHEDULE DATA".format(dt.now()))
        for i in self.schedule_dir.iterdir():
            df = pd.read_csv(i, encoding="ascii")
            df["SourceFile"] = i.name
            df.to_csv(i, index=False)
            _ = exec_bulk_insert("raw", "Schedule", i, 2)
        return None

    def _proc_retro_event_file(self, file: Path) -> None:
        file_name = file.name.replace(".", "_")
        file_year = file_name[0:4]
        game_file_dest = self.game_output_dir / f"game_{file_name}.csv"
        event_file_dest = self.event_output_dir / f"event_{file_name}.csv"
        game_cmd = [
            "bgame",
            "-f",
            "0-85",
            "-y",
            str(file_year),
            "-s",
            "0101",
            "-e",
            "1231",
            str(file),
        ]
        event_cmd = [
            "bevent",
            "-f",
            "0-96",
            "-y",
            str(file_year),
            "-s",
            "0101",
            "-e",
            "1231",
            str(file),
        ]
        game_proc = subprocess.run(
            game_cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE
        )
        event_proc = subprocess.run(
            event_cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE
        )
        with open(game_file_dest, "wb") as f:
            f.write(game_proc.stdout)
        with open(event_file_dest, "wb") as f:
            f.write(event_proc.stdout)
        with open(self.game_log_file, "ab") as f:
            f.write(game_proc.stderr)
        with open(self.event_log_file, "ab") as f:
            f.write(event_proc.stderr)
        return None

    def _rmdir(self, path: Path) -> None:
        if path.exists():
            shutil.rmtree(path)
        else:
            pass
        return None

    def _to_sql_raw_ejection(self) -> None:
        print("|| MSG @ {} || LOADING RAW EJECTION DATA TO DB".format(dt.now()))
        _ = exec_bulk_insert("raw", "Ejection", self.ejections_file, 2)
        return None

    def _to_sql_raw_event(self):
        print("|| MSG @ {} || LOADING RAW EVENT DATA TO DB".format(dt.now()))
        _ = exec_bulk_insert("raw", "Event", self.event_all_file, 1)
        return None

    def _to_sql_raw_franchise_master(self) -> None:
        print("|| MSG @ {} || LOADING RAW TEAM DATA TO DB".format(dt.now()))
        _ = exec_bulk_insert("raw", "FranchiseMaster", self.franchise_master_file, 1)
        return None

    def _to_sql_raw_game(self) -> None:
        print("|| MSG @ {} || LOADING RAW GAME DATA TO DB".format(dt.now()))
        _ = exec_bulk_insert("raw", "Game", self.game_all_file, 1)
        return None

    def _to_sql_raw_park_master(self) -> None:
        print("|| MSG @ {} || LOADING RAW BALLPARK DATA TO DB".format(dt.now()))
        df = pd.read_csv(self.ballparks_file)
        df.to_csv(self.ballparks_file, index=False)
        _ = exec_bulk_insert("raw", "ParkMaster", self.ballparks_file, 2)
        return None

    def _to_sql_raw_player_master(self) -> None:
        print("|| MSG @ {} || LOADING RAW PLAYER DATA TO DB".format(dt.now()))
        _ = exec_bulk_insert("raw", "PlayerMaster", self.bio_file, 2)
        return None

    def _to_sql_raw_team_master(self) -> None:
        print("|| MSG @ {} || LOADING RAW TEAM DATA TO DB".format(dt.now()))
        df = pd.read_csv(self.teams_file)
        df.to_csv(self.teams_file, index=False)
        _ = exec_bulk_insert("raw", "TeamMaster", self.teams_file, 2)
        return None

    def _unzip(self, zip_file: Path, extract_dest: Path, remove: bool = False) -> None:
        with zipfile.ZipFile(zip_file, "r") as f:
            f.extractall(extract_dest)
        if remove:
            os.remove(zip_file)
        return None
    
    def download_and_extract(self):
        _ = self._rmdir(self.data_dir)
        _ = self._mkdir(self.data_dir)
        _ = os.chdir(self.data_dir)
        _ = self._mkdir(self.extract_dir)
        _ = self._mkdir(self.download_dir)
        _ = self._mkdir(self.log_dir)
        _ = self._mkdir(self.output_dir)
        _ = self._mkdir(self.game_output_dir)
        _ = self._mkdir(self.event_output_dir)
        _ = self._download_source_data()
        _ = self._extract_source_data()

    def execute(self):
        start = time.time()
        print("|| MSG @ {} || RETROSHEET ETL PROCESSING STARTED".format(dt.now()))
        _ = self._rmdir(self.data_dir)
        _ = self._mkdir(self.data_dir)
        _ = os.chdir(self.data_dir)
        _ = self._mkdir(self.extract_dir)
        _ = self._mkdir(self.download_dir)
        _ = self._mkdir(self.log_dir)
        _ = self._mkdir(self.output_dir)
        _ = self._mkdir(self.game_output_dir)
        _ = self._mkdir(self.event_output_dir)
        _ = self._db_setup()
        _ = self._download_source_data()
        _ = self._extract_source_data()
        _ = self._load_retro_game_event_data()
        _ = self._load_retro_lookup_data()
        _ = self._load_retro_schedule_data()
        _ = self._load_retro_gamelog_data()
        # _ = self._load_retro_discrepancy_data()
        _ = self._load_dbo()
        end = time.time()
        run_time = round((end - start) / 60, 1)
        print(
            "|| MSG @ {} || RETROSHEET ETL COMPLETED WITH RUNTIME: {} min".format(
                dt.now(), run_time
            )
        )


if __name__ == "__main__":
    _retl = RetrosheetEtl()
    _ = _retl.execute()
