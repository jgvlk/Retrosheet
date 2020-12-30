from datetime import datetime
import pandas as pd
from pathlib import Path


print('||MSG', datetime.now(), '|| STARTING RAW DATA LOAD')


# Setup directories
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
games_out_file = data_dir / 'run/game/GAME_MASTER.csv'

reg_events_dir = data_dir / 'run/event/reg'
post_events_dir = data_dir / 'run/event/post'
as_events_dir = data_dir / 'run/event/as'
events_out_file = data_dir / 'run/event/EVENT_MASTER.csv'


# Load raw game data
print('||MSG', datetime.now(), '|| LOADING RAW REGULAR SEASON GAME DATA')
df_reg_games = pd.DataFrame()
for i in reg_games_dir.iterdir():
    game_file = i
    df_reg_games = df_reg_games.append(pd.read_csv(game_file, encoding='utf-16', names=game_cols))
    print(len(df_reg_games))

print('||MSG', datetime.now(), '|| LOADING RAW POSTSEASON GAME DATA')
df_post_games = pd.DataFrame()
for i in post_games_dir.iterdir():
    game_file = i
    df_post_games = df_post_games.append(pd.read_csv(game_file, encoding='utf-16', names=game_cols))
    print(len(df_post_games))

print('||MSG', datetime.now(), '|| LOADING RAW ALL-STAR GAME DATA')
df_as_games = pd.DataFrame()
for i in as_games_dir.iterdir():
    game_file = i
    df_as_games = df_as_games.append(pd.read_csv(game_file, encoding='utf-16', names=game_cols))
    print(len(df_as_games))


df_reg_games['GameType'] = 'reg'
df_post_games['GameType'] = 'post'
df_as_games['GameType'] = 'as'


df_all_games = pd.DataFrame(None)

df_all_games = df_all_games.append(df_reg_games)
df_all_games = df_all_games.append(df_post_games)
df_all_games = df_all_games.append(df_as_games)

df_all_games = df_all_games.drop_duplicates()


print('||MSG', datetime.now(), '|| WRITING RAW GAME DATA TO MASTER CSV')
df_all_games.to_csv(games_out_file, index=False)


del df_reg_games
del df_post_games
del df_as_games
del df_all_games


print('||MSG', datetime.now(), '|| GAME DATA LOADED TO', games_out_file)


# # Load raw event data
# print('||MSG', datetime.now(), '|| LOADING RAW REGULAR SEASON EVENT DATA')
# df_reg_events = pd.DataFrame()
# for i in reg_events_dir.iterdir():
#     event_file = i
#     df_reg_events = df_reg_events.append(pd.read_csv(event_file, encoding='utf-16', names=event_cols))
#     print(len(df_reg_events))

# print('||MSG', datetime.now(), '|| LOADING RAW POSTSEASON EVENT DATA')
# df_post_events = pd.DataFrame()
# for i in post_events_dir.iterdir():
#     events_file = i
#     df_post_events = df_post_events.append(pd.read_csv(event_file, encoding='utf-16', names=event_cols))
#     print(len(df_post_events))

# print('||MSG', datetime.now(), '|| LOADING RAW ALL-STAR EVENT DATA')
# df_as_events = pd.DataFrame()
# for i in as_events_dir.iterdir():
#     event_file = i
#     df_as_events = df_as_events.append(pd.read_csv(event_file, encoding='utf-16', names=event_cols))
#     print(len(df_as_events))


# df_all_events = pd.DataFrame(None)

# df_all_events = df_all_events.append(df_reg_events)
# df_all_events = df_all_events.append(df_post_events)
# df_all_events = df_all_events.append(df_as_events)

# df_all_events = df_all_events.drop_duplicates()


# print('||MSG', datetime.now(), '|| WRITING RAW EVENT DATA TO MASTER CSV')
# df_all_events.to_csv(events_out_file, index=False)


# del df_reg_events
# del df_post_events
# del df_as_events
# del df_all_events


# print('||MSG', datetime.now(), '|| EVENT DATA LOADED TO', games_out_file)

