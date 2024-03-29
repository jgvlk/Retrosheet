from pathlib import Path

from sqlalchemy import text

from db.session_manager import SessionManager


def exec_bulk_insert(
    db_schema: str, db_table: str, data_file_path: Path, first_row: int
):
    _db = SessionManager()
    sql_bulk_insert = """
        bulk insert {}.{} from "{}" with (
            format = 'csv',
            firstrow = {}
        );
    """.format(
        db_schema,
        db_table,
        data_file_path,
        first_row,
    )
    _db.session.execute(text(sql_bulk_insert))
    _db.session.commit()
    _db.session.close()


def exec_sql_file(sql_file_path: Path):
    _db = SessionManager()
    with open(sql_file_path) as f:
        sql = f.read()
    result = _db.session.execute(text(sql))
    _db.session.commit()
    _db.session.close()
    return result
