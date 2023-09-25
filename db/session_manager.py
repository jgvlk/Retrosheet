import os
from urllib.parse import quote_plus

from sqlalchemy import create_engine
from sqlalchemy.orm import Session


if os.name != "nt":
    db_conn_str_raw_retro = "DRIVER={/usr/local/Cellar/msodbcsql18/18.3.1.1/lib/libmsodbcsql.18.dylib};SERVER=.,49854;DATABASE=Retrosheet;UID=sa;PWD=MuSiC1995!!1030;TrustServerCertificate=yes;"
else:
    db_conn_str_raw_retro = "DRIVER={SQL Server};SERVER=.\MSSQLDEV;DATABASE=Retrosheet;"

db_conn_str_retro = quote_plus(db_conn_str_raw_retro)
db_conn_str_retro = f"mssql+pyodbc:///?odbc_connect={db_conn_str_retro}"
engine_retro = create_engine(db_conn_str_retro)


class SessionManager(object):
    def __init__(self):
        self.session = Session(engine_retro)
