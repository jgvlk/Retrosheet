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

        self.all_data_zip: Path = self.download_dir / "alldata.zip"
        
        self.allas_dir: Path = self.extract_dir / "allas"
        self.allpost_dir: Path = self.extract_dir / "allpost"
        self.boxes_dir: Path = self.extract_dir / "boxes"
        self.discrepancies_dir: Path = self.extract_dir / "discrepancies"
        self.events_dir: Path = self.extract_dir / "events"
        self.gamelogs_dir: Path = self.extract_dir / "gamelogs"
        self.ngldata_dir: Path = self.extract_dir / "ngldata"
        self.rosters_dir: Path = self.extract_dir / "rosters"
        self.schedule_dir: Path = self.extract_dir / "schedule"
        self.teams_dir: Path = self.extract_dir / "teams1871-2022"
        self.ballparks_file: Path = self.extract_dir / "ballparks.csv"
        self.bio_file: Path = self.extract_dir / "biofile.csv"
        self.ejections_file: Path = self.extract_dir / "ejections.csv"
        self.teams_file: Path = self.extract_dir / "teams.csv"

        self.game_output_dir: Path = self.output_dir / "game"
        self.event_output_dir: Path = self.output_dir / "event"

        self.file_extensions = ["EDA", "EVA", ".EVE", ".EVF", ".EVN", ".EVR"]

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
    
    def _proc_event(self):
        pass
    
    def _proc_game_event(self, file: Path):
        file_name = file.name.replace(".", "_")
        file_year = file_name[0:4]
        game_file_dest = self.game_output_dir / f"game_{file_name}.csv"
        event_file_dest = self.event_output_dir / f"event_{file_name}.csv"
        game_cmd = ["bgame", "-f", "0-85", "-y", str(file_year), "-s", "0101", "-e", "1231", str(file)]
        event_cmd = ["bevent", "-f", "0-96", "-y", str(file_year), "-s", "0101", "-e", "1231", str(file)]
        game_proc = subprocess.run(game_cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        event_proc = subprocess.run(event_cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        with open(game_file_dest, "wb") as f:
            f.write(game_proc.stdout)
        with open(event_file_dest, "wb") as f:
            f.write(event_proc.stdout)
        return game_proc, event_proc
    
    def _process_allas(self) -> None:
        os.chdir(self.run_dir)
        for i in self.allas_dir.iterdir():
            dest_file = self.run_dir / i.name
            shutil.copy(i, dest_file)
        for i in self.run_dir.glob(r"**/*"):
            if i.suffix in self.file_extensions:
                _ = self._proc_game_event(i)
        os.chdir(self.data_dir)
        _ = self._rmdir(self.run_dir)
        return None
    
    def _rmdir(self, path: Path) -> None:
        if path.exists():
            shutil.rmtree(path)
        else:
            pass
        return None

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
        _ = self._mkdir(self.run_dir)
        print("|| MSG @ {} || DOWNLOADING AND EXTRACTING SOURE DATA FROM https://www.retrosheet.org/".format(dt.now()))
        _ = self._download_source_data()
        _ = self._unzip(self.all_data_zip, self.extract_dir)
        for i in self.extract_dir.glob("*.zip"):
            extract_dir = self.extract_dir / i.name.replace(".zip", "")
            _ = _retl._unzip(i, extract_dir, remove=True)
        for i in self.ngldata_dir.glob("*.zip"):
            extract_dir = self.ngldata_dir / i.name.replace(".zip", "")
            _ = _retl._unzip(i, extract_dir, remove=True)
        print("|| MSG @ {} || PROCESSING 'allas' DATA".format(dt.now()))
        _ = self._process_allas()
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
