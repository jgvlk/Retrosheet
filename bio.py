from pathlib import Path
import requests

import pandas as pd

from db.repository import exec_bulk_insert


url_biofile = "https://www.retrosheet.org/BIOFILE.TXT"
biofile_path = Path("./bio_file_test.csv")
response = requests.get(url_biofile)
with open(biofile_path, "w") as f:
    f.write(response.text)
    f.close()


df_biofile = pd.read_csv(biofile_path)

new_biofile_cols = []
for i in df_biofile.columns:
    new_col_name = i.replace(" ", "_")
    new_biofile_cols.append(new_col_name)
df_biofile.columns = new_biofile_cols


print(df_biofile.head())


df_biofile.to_csv(biofile_path, index=False)

biofile_path = Path("/Users/jonathanvlk/dev/Retrosheet/bio_file_test.csv")
exec_bulk_insert("raw", "PlayerMaster", biofile_path.absolute())
