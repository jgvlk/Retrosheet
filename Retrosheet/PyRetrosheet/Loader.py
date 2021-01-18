from datetime import datetime
from pathlib import Path
from urllib.parse import quote_plus

import pandas as pd
from pprint import pprint
from sqlalchemy import event
from sqlalchemy.dialects import mssql

from Retrosheet.PyRetrosheet.ConnManager import SessionManager


def load_retro_data():
    try:

        print('||MSG', datetime.now(), '|| STARTING RAW DATA LOAD')

        try:
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

            reg_events_dir = data_dir / 'run/event/reg'
            post_events_dir = data_dir / 'run/event/post'
            as_events_dir = data_dir / 'run/event/as'

        except Exception as e:
            print('|| ERR @', datetime.now(), '|| ERROR MESSAGE:', e)

        try:
            db = SessionManager()
            conn = db.session.connection()
            _engine = db.engine

            @event.listens_for(_engine, 'before_cursor_execute')
            def receive_before_cursor_execute(conn, cursor, statement, params, context, executemany):
                if executemany:
                    cursor.fast_executemany = True

            print('||MSG', datetime.now(), '|| LOADING RAW REGULAR SEASON GAME DATA')
            for i in reg_games_dir.iterdir():
                game_file = i
                df = pd.read_csv(game_file, encoding='utf-16', names=game_cols)
                df['GameType'] = 'Regular Season'
                df.to_sql(name='Game', con=conn, schema='raw', if_exists='append', index=False, dtype={col_name: mssql.VARCHAR(500) for col_name in df})

            db.session.flush()

            print('||MSG', datetime.now(), '|| LOADING RAW POSTSEASON GAME DATA')
            for i in post_games_dir.iterdir():
                game_file = i
                df = pd.read_csv(game_file, encoding='utf-16', names=game_cols)
                df['GameType'] = 'Postseason'
                df.to_sql(name='Game', con=conn, schema='raw', if_exists='append', index=False, dtype={col_name: mssql.VARCHAR(500) for col_name in df})

            db.session.flush()

            print('||MSG', datetime.now(), '|| LOADING RAW ALL-STAR GAME DATA')
            for i in as_games_dir.iterdir():
                game_file = i
                df = pd.read_csv(game_file, encoding='utf-16', names=game_cols)
                df['GameType'] = 'All-Star'
                df.to_sql(name='Game', con=conn, schema='raw', if_exists='append', index=False, dtype={col_name: mssql.VARCHAR(500) for col_name in df})

            db.session.commit()

            del df

            print('||MSG', datetime.now(), '|| GAME DATA LOADED TO [Retrosheet] DB')

        except:
            db.session.rollback()

            print('|| ERR @', datetime.now(), '|| ERROR MESSAGE:', e)
            print('|| ERR @', datetime.now(), '|| AN ERROR OCCURED WHILE LOADING RAW EVENT DATA TO [Retrosheet]')

        finally:
            db.session.close()

        try:
            db = SessionManager()
            conn = db.session.connection()
            _engine = db.engine

            @event.listens_for(_engine, 'before_cursor_execute')
            def receive_before_cursor_execute(conn, cursor, statement, params, context, executemany):
                if executemany:
                    cursor.fast_executemany = True

            print('||MSG', datetime.now(), '|| LOADING RAW REGULAR SEASON EVENT DATA')
            for i in reg_events_dir.iterdir():
                event_file = i
                df = pd.read_csv(event_file, encoding='utf-16', names=event_cols)
                df.to_sql(name='Event', con=conn, schema='raw', if_exists='append', index=False, dtype={col_name: mssql.VARCHAR(500) for col_name in df})

            db.session.flush()

            print('||MSG', datetime.now(), '|| LOADING RAW POSTSEASON EVENT DATA')
            for i in post_events_dir.iterdir():
                event_file = i
                df = pd.read_csv(event_file, encoding='utf-16', names=event_cols)
                df.to_sql(name='Event', con=conn, schema='raw', if_exists='append', index=False, dtype={col_name: mssql.VARCHAR(500) for col_name in df})

            db.session.flush()

            print('||MSG', datetime.now(), '|| LOADING RAW ALL-STAR EVENT DATA')
            for i in as_events_dir.iterdir():
                event_file = i
                df = pd.read_csv(event_file, encoding='utf-16', names=event_cols)
                df.to_sql(name='Event', con=conn, schema='raw', if_exists='append', index=False, dtype={col_name: mssql.VARCHAR(500) for col_name in df})

            db.session.commit()

            del df

            print('||MSG', datetime.now(), '|| EVENT DATA LOADED TO [Retrosheet] DB')

        except:
            db.session.rollback()

            print('|| ERR @', datetime.now(), '|| ERROR MESSAGE:', e)
            print('|| ERR @', datetime.now(), '|| AN ERROR OCCURED WHILE LOADING RAW EVENT DATA TO [Retrosheet]')

        finally:
            db.session.close()

    except Exception as e:
        print('|| ERR @', datetime.now(), '|| ERROR MESSAGE:', e)
        print('|| ERR @', datetime.now(), '|| AN ERROR OCCURED WHILE LOADING RAW GAME AND EVENT DATA TO [Retrosheet]')

