from pathlib import Path
from pprint import pprint
import requests
import subprocess
import sys

import pandas as pd
from sqlalchemy import text

from db.repository import exec_sql_file
from db.session_manager import SessionManager


def load_retro_data():
    root_dir = Path("C:/Data/Retrosheet")
    data_dir = root_dir / "data"

    game_cols_file = data_dir / "metadata/game_fields.csv"
    game_cols_data = pd.read_csv(game_cols_file)

    event_cols_file = data_dir / "metadata/event_fields.csv"
    event_cols_data = pd.read_csv(event_cols_file)

    game_cols = []
    for i in game_cols_data["ColumnName"]:
        game_cols.append(i)

    event_cols = []
    for i in event_cols_data["ColumnName"]:
        event_cols.append(i)

    reg_games_dir = data_dir / "run/game/reg"
    # post_games_dir = data_dir / "run/game/post"
    # as_games_dir = data_dir / "run/game/as"

    reg_events_dir = data_dir / "run/event/reg"
    # post_events_dir = data_dir / "run/event/post"
    # as_events_dir = data_dir / "run/event/as"

    dfs_game = []
    game_all_path = data_dir / "game_all.csv"
    for i in reg_games_dir.glob("game*"):
        df = pd.read_csv(i, encoding="utf-16", names=game_cols)
        dfs_game.append(df)
    df_game = pd.concat(dfs_game)
    df_game["GameType"] = "Regular Season"
    df_game.to_csv(game_all_path, index=False)

    dfs_event = []
    event_all_path = data_dir / "event_all.csv"
    for i in reg_events_dir.glob("event*"):
        df = pd.read_csv(i, encoding="utf-16", names=event_cols)
        dfs_event.append(df)
    df_event = pd.concat(dfs_event)
    df_event.to_csv(event_all_path, index=False)

    sql_bulk_insert = """
        truncate table raw.Game;
        bulk insert raw.Game from "{}" with (
            format = "csv",
            firstrow = 2
        );
    """.format(
        game_all_path
    )
    db = SessionManager()
    db.session.execute(text(sql_bulk_insert))
    db.session.commit()
    db.session.close()

    sql_bulk_insert = """
        truncate table raw.Event;
        bulk insert raw.Event from "{}" with (
            format = "csv",
            firstrow = 2
        );
    """.format(
        event_all_path
    )
    db = SessionManager()
    db.session.execute(text(sql_bulk_insert))
    db.session.commit()
    db.session.close()


def update_supp_retro_data():
    pass


def load_supp_retro_data():
    url_biofile = "https://www.retrosheet.org/BIOFILE.TXT"
    response = requests.get(url_biofile)
    supp_data_dir = Path("./data/supplemental")
    biofile_path = supp_data_dir / "bio_file.csv"
    with open(biofile_path, "w") as f:
        f.write(response.text)
        f.close()

    df_biofile = pd.read_csv(biofile_path)
    new_cols = []
    for i in df_biofile.columns:
        new_col_name = i.replace(" ", "_")
        new_cols.append(new_col_name)
    df_biofile.columns = new_cols
    df_biofile.to_csv(biofile_path, index=False)

    sql_bulk_insert_biofile = """
        truncate table raw.PlayerMaster;
        bulk insert raw.PlayerMaster from "{}" with (
            format = 'csv',
            firstrow = 2
        );
    """.format(
        biofile_path.absolute()
    )

    db = SessionManager()
    db.session.execute(text(sql_bulk_insert_biofile))
    db.session.commit()
    db.session.close()

    url_teamabbr = "https://www.retrosheet.org/TEAMABR.TXT"
    response = requests.get(url_teamabbr)
    teamabbr_path = supp_data_dir / "team_abbr.csv"
    with open(teamabbr_path, "w") as f:
        f.write(response.text)
        f.close()

    df_teamabbr = pd.read_csv(
        teamabbr_path,
        keep_default_na=False,
        names=["TeamAbbr", "League", "City", "Nickname", "Start", "End"],
    )

    df_teamabbr.to_csv(teamabbr_path, index=False)

    sql_bulk_insert_teamabbr = """
        truncate table raw.TeamMaster;
        bulk insert raw.TeamMaster from "{}" with (
            format = 'csv',
            firstrow = 2
        );
    """.format(
        teamabbr_path.absolute()
    )

    db = SessionManager()
    db.session.execute(text(sql_bulk_insert_teamabbr))
    db.session.commit()
    db.session.close()

    url_parkcodes = "https://www.retrosheet.org/parkcode.txt"
    response = requests.get(url_parkcodes)
    parkcodes_path = supp_data_dir / "park_code.csv"
    with open(parkcodes_path, "w") as f:
        f.write(response.text)
        f.close()

    df_parkcodes = pd.read_csv(parkcodes_path)
    df_parkcodes.to_csv(parkcodes_path, index=False)

    sql_bulk_insert_parkcode = """
        truncate table raw.ParkMaster;
        bulk insert raw.ParkMaster from "{}" with (
            format = 'csv',
            firstrow = 2
        );
    """.format(
        parkcodes_path.absolute()
    )

    db = SessionManager()
    db.session.execute(text(sql_bulk_insert_parkcode))
    db.session.commit()
    db.session.close()

    franchise_path = supp_data_dir / "current_name.csv"
    sql_bulk_insert_franchise = """
        truncate table raw.FranchiseMaster;
        bulk insert raw.FranchiseMaster from "{}" with (
            format = 'csv',
            firstrow = 2
        );
    """.format(
        franchise_path.absolute()
    )

    db = SessionManager()
    db.session.execute(text(sql_bulk_insert_franchise))
    db.session.commit()
    db.session.close()


def main():
    sql_dir = Path("./sql")
    sql_etld = {
        "sql_path_drop_fks": sql_dir / "__ETL_Retrosheet__DropFKs.sql",
        "sql_path_truncate_tables": sql_dir / "__ETL_Retrosheet__TruncateTables.sql",
        "sql_path_raw_to_stg": sql_dir / "__ETL_Retrosheet__RawToStg.sql",
        "sql_path_stg_to_dbo": sql_dir / "__ETL_Retrosheet__StgToDbo.sql",
        "sql_path_add_fks": sql_dir / "__ETL_Retrosheet__AddFKs.sql",
    }
    _ = exec_sql_file(sql_etld["sql_path_drop_fks"])
    _ = exec_sql_file(sql_etld["sql_path_truncate_tables"])
    downloader = subprocess.Popen(
        [
            "powershell.exe",
            r"C:\Users\jonat\source\repos\Retrosheet\scripts\downloader.ps1",
        ],
        stdout=sys.stdout,
    )
    downloader.communicate()
    processer = subprocess.Popen(
        [
            "powershell.exe",
            r"C:\Users\jonat\source\repos\Retrosheet\scripts\processer.ps1",
        ],
        stdout=sys.stdout,
    )
    processer.communicate()
    _ = load_supp_retro_data()
    _ = load_retro_data()
    _ = exec_sql_file(sql_etld["sql_path_raw_to_stg"])
    _ = exec_sql_file(sql_etld["sql_path_stg_to_dbo"])
    _ = exec_sql_file(sql_etld["sql_path_add_fks"])
    processer = subprocess.Popen(
        [
            "powershell.exe",
            r"C:\Users\jonat\source\repos\Retrosheet\scripts\cleaner.ps1",
        ],
        stdout=sys.stdout,
    )
    _ = processer.communicate()


if __name__ == "__main__":
    main()
