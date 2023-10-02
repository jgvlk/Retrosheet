from urllib.parse import quote_plus

from sqlalchemy import create_engine
from sqlalchemy.orm import Session


db_conn_str_raw_retro = (
    "DRIVER={SQL Server};SERVER=.\MSSQLSERVER01;DATABASE=Retrosheet;"
)
db_conn_str_retro = quote_plus(db_conn_str_raw_retro)
db_conn_str_retro = f"mssql+pyodbc:///?odbc_connect={db_conn_str_retro}"
engine_retro = create_engine(db_conn_str_retro)


class SessionManager(object):
    def __init__(self):
        self.session = Session(engine_retro)
