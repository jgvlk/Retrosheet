import os
from pathlib import Path


# File counts

raw_files = []
for i in os.listdir(r'C:\Data\mlb\Retrosheet\data\run'):
    raw_files.append(i)

event_files = []
for i in os.listdir(r'C:\Data\mlb\Retrosheet\data\processed\2020-12-25@16.30.10\event'):
    event_files.append(i)

game_files = []
for i in os.listdir(r'C:\Data\mlb\Retrosheet\data\processed\2020-12-25@16.30.10\game'):
    game_files.append(i)


raw_ct = len(raw_files)
event_ct = len(event_files)
game_ct = len(game_files)


print('count raw files:', raw_ct)
print('count event files:', event_ct)
print('count of game files:', game_ct)





# File types

run_dir = Path(r'C:/Data/mlb/Retrosheet/data/run')

ext = []
for i in run_dir.iterdir():
    ext.append(i.suffix)


dist_ext = []
for i in ext:
    if i not in dist_ext:
        dist_ext.append(i)


dist_ext.sort()
print(dist_ext)
