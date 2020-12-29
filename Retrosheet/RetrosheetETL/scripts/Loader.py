import chardet
from datetime import datetime
import pandas as pd
from pathlib import Path
from sqlalchemy import create_engine, event
from sqlalchemy.dialects import mssql
from sqlalchemy.orm import sessionmaker
from urllib.parse import quote_plus


print('start')
print(datetime.now())


# Create Session
db_conn_str = r'DRIVER={SQL Server};SERVER=.\MSSQLDEV;DATABASE=Retrosheet;TRUSTED_CONNECTION=Yes;'
db_conn_str = quote_plus(db_conn_str)

engine = create_engine("mssql+pyodbc:///?odbc_connect=%s" % db_conn_str)

Session = sessionmaker(bind=engine)

class SessionManager(object):
    def __init__(self):
        self.session = Session()
        self.engine = engine

db = SessionManager()
conn = db.session.connection()
_engine = db.engine


@event.listens_for(_engine, 'before_cursor_execute')
def receive_before_cursor_execute(conn, cursor, statement, params, context, executemany):
    if executemany:
        cursor.fast_executemany = True



root_dir = Path('C:/Data/mlb/Retrosheet')
data_dir = root_dir / 'data'

game_cols_file = data_dir / 'metadata/game_fields.csv'
game_cols_data = pd.read_csv(game_cols_file)

event_cols_file = data_dir / 'metadata/event_fields.csv'
event_cols_data = pd.read_csv(event_cols_file)


game_cols = []
for i in game_cols_data['ColumnName']:
    game_cols.append(i)

event_cols = []
for i in event_cols_data['ColumnName']:
    event_cols.append(i)


reg_games_dir = data_dir / 'run/game/reg'
post_games_dir = data_dir / 'run/game/post'
as_games_dir = data_dir / 'run/game/as'


print('loading reg season data')
print(datetime.now())
df_reg_games = pd.DataFrame()
for i in reg_games_dir.iterdir():
    game_file = i
    df_reg_games = df_reg_games.append(pd.read_csv(game_file, encoding='utf-16', names=game_cols))

df_reg_games['GameType'] = 'reg'
df_reg_games.to_sql(name='Game', con=conn, schema='raw', if_exists='append', index=False, dtype={col_name: mssql.NVARCHAR(500) for col_name in df_reg_games})
db.session.commit()


print('loading postseason data')
print(datetime.now())
df_post_games = pd.DataFrame()
for i in post_games_dir.iterdir():
    game_file = i
    df_post_games = df_post_games.append(pd.read_csv(game_file, encoding='utf-16', names=game_cols))

df_post_games['GameType'] = 'post'
df_post_games.to_sql(name='Game', con=conn, schema='raw', if_exists='append', index=False, dtype={col_name: mssql.NVARCHAR(500) for col_name in df_post_games})
db.session.commit()


print('loading all-star data')
print(datetime.now())
df_as_games = pd.DataFrame()
for i in as_games_dir.iterdir():
    game_file = i
    df_as_games = df_as_games.append(pd.read_csv(game_file, encoding='utf-16', names=game_cols))

df_as_games['GameType'] = 'as'
df_as_games.to_sql(name='Game', con=conn, schema='raw', if_exists='append', index=False, dtype={col_name: mssql.NVARCHAR(500) for col_name in df_as_games})
db.session.commit()


print('end')
print(datetime.now())




















# with open(r'C:\Users\indreshb\Downloads\Pokemon.csv', 'rb') as f:

# result = chardet.detect(f.read()) # or readline if the file is large

# df=pd.read_csv(r'C:\Users\indreshb\Downloads\Pokemon.csv',encoding=result['encoding'])

