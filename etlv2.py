from datetime import datetime as dt
import os
from pathlib import Path
import requests
import shutil
import subprocess
import sys
import time
import zipfile

import pandas as pd

from db.repository import exec_bulk_insert, exec_sql_file


class RetrosheetEtl:
    def __init__(
        self,
        data_dir: Path = Path("C:/Data/Retrosheet"),
        repo_dir: Path = Path("C:/repos/Retrosheet"),
    ) -> None:
        self.data_dir: Path = data_dir
        self.repo_dir: Path = repo_dir
        self.download_dir: Path = self.data_dir / "download"
        self.extract_dir: Path = self.data_dir / "extract"
        self.log_dir: Path = self.data_dir / "log"
        self.output_dir: Path = self.data_dir / "output"
        self.run_dir: Path = self.data_dir / "run"

        self.allas_dir: Path = self.extract_dir / "allas"
        self.allpost_dir: Path = self.extract_dir / "allpost"
        self.boxes_dir: Path = self.extract_dir / "boxes"
        self.discrepancies_dir: Path = self.extract_dir / "discrepancies"
        self.events_dir: Path = self.extract_dir / "events"
        self.gamelogs_dir: Path = self.extract_dir / "gamelogs"
        self.ngldata_dir: Path = self.extract_dir / "ngldata"
        self.ngldata_events_dir: Path = self.ngldata_dir / "ngl-events"
        self.rosters_dir: Path = self.extract_dir / "rosters"
        self.schedule_dir: Path = self.extract_dir / "schedule"
        self.teams_dir: Path = self.extract_dir / "teams1871-2022"

        self.all_data_zip: Path = self.download_dir / "alldata.zip"
        self.ballparks_file: Path = self.extract_dir / "ballparks.csv"
        self.bio_file: Path = self.extract_dir / "biofile.csv"
        self.ejections_file: Path = self.extract_dir / "ejections.csv"
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

        self.url_all_data: Path = "https://www.retrosheet.org/downloads/alldata.zip"

    def _download_source_data(self) -> None:
        all_data = requests.get(self.url_all_data)
        with open(self.all_data_zip, "wb") as f:
            f.write(all_data.content)
        return None

    def _mkdir(self, path: Path) -> None:
        if path.exists():
            pass
        else:
            os.mkdir(path)
        return None

    def _proc_game_event(self, file: Path) -> None:
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

    def _process_retro_event_files(self) -> None:
        _ = self._mkdir(self.run_dir)
        os.chdir(self.run_dir)
        print("|| MSG @ {} || PROCESSING RETROSHEET 'allas' DATA".format(dt.now()))
        for i in self.allas_dir.iterdir():
            dest_file = self.run_dir / i.name
            shutil.copy(i, dest_file)
        for i in self.run_dir.glob(r"**/*"):
            if i.suffix in self.file_extensions:
                _ = self._proc_game_event(i)
        os.chdir(self.data_dir)
        _ = self._rmdir(self.run_dir)
        _ = self._mkdir(self.run_dir)
        _ = os.chdir(self.run_dir)
        print(
            "|| MSG @ {} || PROCESSING RETROSHEET 'allpost', 'events', 'ngl-events' DATA".format(
                dt.now()
            )
        )
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
                _ = self._proc_game_event(i)
        print(
            "|| MSG @ {} || LOADING RAW DATA TO DB".format(
                dt.now()
            )
        )
        _ = self._to_sql_raw_game()
        _ = self._to_sql_raw_evnet()
        os.chdir(self.data_dir)
        _ = self._rmdir(self.run_dir)
        return None

    def _rmdir(self, path: Path) -> None:
        if path.exists():
            shutil.rmtree(path)
        else:
            pass
        return None
    
    def _to_sql_raw_game(self):
        for i in self.game_output_dir.iterdir():
            exec_bulk_insert("raw", "Game", i)

    def _to_sql_raw_event(self):
        for i in self.event_output_dir.iterdir():
            exec_bulk_insert("raw", "Game", i)

    def _unzip(self, zip_file: Path, extract_dest: Path, remove: bool = False) -> None:
        with zipfile.ZipFile(zip_file, "r") as f:
            f.extractall(extract_dest)
        if remove:
            os.remove(zip_file)
        return None

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
        print(
            "|| MSG @ {} || DOWNLOADING AND EXTRACTING SOURE DATA FROM https://www.retrosheet.org/".format(
                dt.now()
            )
        )
        _ = self._download_source_data()
        _ = self._unzip(self.all_data_zip, self.extract_dir)
        for i in self.extract_dir.glob("*.zip"):
            extract_dir = self.extract_dir / i.name.replace(".zip", "")
            _ = _retl._unzip(i, extract_dir, remove=True)
        for i in self.ngldata_dir.glob("*.zip"):
            extract_dir = self.ngldata_dir / i.name.replace(".zip", "")
            _ = _retl._unzip(i, extract_dir, remove=True)
        _ = self._process_retro_event_files()
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


_retl = RetrosheetEtl()
game_cols_file = _retl.game_cols_file
event_cols_file = _retl.event_cols_file
game_output_dir = _retl.game_output_dir
event_output_dir = _retl.event_output_dir
# game_cols_data = pd.read_csv(game_cols_file)
# event_cols_data = pd.read_csv(event_cols_file)
# game_cols = []
# for i in game_cols_data["ColumnName"]:
#     game_cols.append(i)
# event_cols = []
# for i in event_cols_data["ColumnName"]:
#     event_cols.append(i)
# dfs_game = []
# for i in game_output_dir.iterdir():
#     df = pd.read_csv(i, names=game_cols)
#     df["SourceFile"] = str(i)
#     dfs_game.append(df)
# df_game = pd.concat(dfs_game)
# dfs_event = []
# for i in event_output_dir.iterdir():
#     df = pd.read_csv(i, names=event_cols)
#     df["SourceFile"] = str(i)
#     dfs_event.append(df)
# df_event = pd.concat(dfs_event)



for i in game_output_dir.iterdir():
    exec_bulk_insert("raw", "Game", i)