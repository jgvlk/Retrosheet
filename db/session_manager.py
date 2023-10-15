import os
from urllib.parse import quote_plus

from sqlalchemy import create_engine
from sqlalchemy.orm import Session


if os.name == "posix":
    db_pwd = os.getenv("DB_PASSWORD")
    db_conn_str_raw = (
        "DRIVER={/usr/local/Cellar/msodbcsql18/18.3.1.1/lib/libmsodbcsql.18.dylib};Server=127.0.0.1;Database=Retrosheet;UID=sa;PWD={};TrustServerCertificate=yes;".format(db_pwd)
    )
elif os.name == "nt":
    db_conn_str_raw = (
        "DRIVER={SQL Server};Server=.;Database=Retrosheet;TrustServerCertificate=yes;"
    )

db_conn_str = quote_plus(db_conn_str_raw)
db_conn_str = f"mssql+pyodbc:///?odbc_connect={db_conn_str}"
engine = create_engine(db_conn_str)

class SessionManager(object):
    def __init__(self):
        self.session = Session(engine)
