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
        download=False,
        process=True,
        data_dir=Path("C:/Data/Retrosheet"),
        repo_dir=Path("C:/repos/Retrosheet"),
    ):
        self.data_dir = data_dir
        self.repo_dir = repo_dir
        self.download_dir = self.data_dir / "download"
        self.extract_dir = self.data_dir / "extract"
        self.run_dir = self.data_dir / "run"
        self.all_data_zip = self.download_dir / "alldata.zip"
        self.download = download
        self.process = process

        self.url_all_data = "https://www.retrosheet.org/downloads/alldata.zip"

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

    def _unzip(self, zip_file: Path, extract_dest: Path, remove: bool = False) -> None:
        with zipfile.ZipFile(zip_file, "r") as f:
            f.extractall(extract_dest)
        if remove:
            os.remove(zip_file)
        return None

    def execute(self):
        start = time.time()
        print("|| MSG @ {} || RETROSHEET ETL PROCESSING STARTED".format(dt.now()))
        _ = self._mkdir(self.data_dir)
        _ = self._mkdir(self.run_dir)
        if self.download:
            print("|| MSG @ {} || DOWNLOADING AND EXTRACTING SOURE DATA FROM https://www.retrosheet.org/".format(dt.now()))
            _ = self._mkdir(self.download_dir)
            _ = self._mkdir(self.extract_dir)
            _ = self._download_source_data()
            _ = self._unzip(self.all_data_zip, self.extract_dir)
            for i in self.extract_dir.glob("*.zip"):
                extract_dir = self.extract_dir / i.name.replace(".zip", "")
                _ = _retl._unzip(i, extract_dir, remove=True)
        end = time.time()
        run_time = round((end - start) / 60, 1)
        print(
            "|| MSG @ {} || RETROSHEET ETL COMPLETED WITH RUNTIME: {} min".format(
                dt.now(), run_time
            )
        )


_retl = RetrosheetEtl(download=True)
_ = _retl.execute()
