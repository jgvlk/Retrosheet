import os
from urllib.parse import quote_plus

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker


db_conn_str = r'DRIVER={SQL Server};SERVER=.;DATABASE=Retrosheet;TRUSTED_CONNECTION=Yes;'
db_conn_str = quote_plus(db_conn_str)

engine = create_engine("mssql+pyodbc:///?odbc_connect=%s" % db_conn_str)

Session = sessionmaker(bind=engine)

class SessionManager(object):
    def __init__(self):
        self.session = Session()
        self.engine = engine

