import os
from urllib.parse import quote_plus

from sqlalchemy import create_engine
from sqlalchemy.orm import Session

if os.name != "nt":
    db_conn_str_raw_sb = "DRIVER={/usr/local/Cellar/msodbcsql17/17.10.2.1/lib/libmsodbcsql.17.dylib};SERVER=.,49854;DATABASE=SportsBetting;UID=sa;PWD=MuSiC1995!!1030;"
else:
    db_conn_str_raw_retro = (
        "DRIVER={SQL Server};SERVER=.;DATABASE=Retrosheet;Trusted Connection=Yes;"
    )
    # db_conn_str_raw_retro = "DRIVER={SQL Server};SERVER=127.0.0.1,49854;DATABASE=Retrosheet;UID=sa;PWD=MuSiC1995!!1030;"

db_conn_str_retro = quote_plus(db_conn_str_raw_retro)
db_conn_str_retro = f"mssql+pyodbc:///?odbc_connect={db_conn_str_retro}"
engine_retro = create_engine(db_conn_str_retro)


class SessionManager(object):
    def __init__(self):
        self.session = Session(engine_retro)
