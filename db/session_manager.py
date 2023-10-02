from urllib.parse import quote_plus

from sqlalchemy import create_engine
from sqlalchemy.orm import Session


db_conn_str_raw = (
    "DRIVER={SQL Server};SERVER=.;DATABASE=Retrosheet;"
)
db_conn_str = f"mssql+pyodbc:///?odbc_connect={quote_plus(db_conn_str_raw)}"
engine = create_engine(db_conn_str)


class SessionManager(object):
    def __init__(self):
        self.session = Session(engine)
