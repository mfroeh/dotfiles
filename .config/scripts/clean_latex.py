from genericpath import isdir
import os
from pathlib import Path

for file in Path(f"{Path.home()}/uni/").glob("**/*"):
    if file.name.endswith((".aux", ".fdb_latexmk", ".fls", ".log", ".synctex.gz" )):
        os.remove(file)
        print(file)