from urllib.parse import quote_plus

from sqlalchemy import create_engine
from sqlalchemy.orm import Session


db_conn_str_raw = (
    "DRIVER={SQL Server};Server=.;Database=Retrosheet;Trusted_Connection=True;"
)
db_conn_str = quote_plus(db_conn_str_raw)
db_conn_str = f"mssql+pyodbc:///?odbc_connect={db_conn_str}"
engine = create_engine(db_conn_str)


class SessionManager(object):
    def __init__(self):
        self.session = Session(engine)
