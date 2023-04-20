from pathlib import Path

from sqlalchemy import text

from db.session_manager import SessionManager


def exec_sql_file(sql_file_path: Path):
    _db = SessionManager()
    with open(sql_file_path) as f:
        sql = f.read()
    result = _db.session.execute(text(sql))
    _db.session.commit()
    _db.session.close()
    return result
