from dateparser import parse as dtparse
from datetime import datetime as dt
from pathlib import Path

import pandas as pd
from sqlalchemy import text

from db.session_manager import SessionManager


_db = SessionManager()
_db_conn = _db.session.connection()

sql_max_dt = "select max(Date) as max_dt from dbo.Game"
max_dt = dtparse(_db.session.execute(text(sql_max_dt)).one()[0])

extract_cfg = {
    "path": Path("C:/Data/Retrosheet"),
    "tables": [
        "Event",
        "FranchiseMaster",
        "Game",
        "GameType",
        "ParkMaster",
        "PlayerMaster",
        "TeamMaster",
    ],
    "file_name_date_part": "{}000000".format(max_dt.strftime(r"%Y%m%d")),
}


if __name__ == "__main__":
    for i in extract_cfg["tables"]:
        extract_file = extract_cfg["path"] / "Retrosheet-{}-{}.csv".format(
            i, extract_cfg["file_name_date_part"]
        )
        print("|| MSG @ {} || EXTRACTING CSV DATA FOR: {}".format(dt.now(), extract_file))
        df = pd.read_sql_query("select * from dbo.{}".format(i), _db_conn)
        df.to_csv(extract_file, index=False)
