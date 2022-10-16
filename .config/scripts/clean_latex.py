from genericpath import isdir
import os
from pathlib import Path

for file in Path(f"{Path.home()}/org/").glob("**/*"):
    if file.name.endswith((".aux", ".fdb_latexmk", ".fls", ".log", ".synctex.gz", ".bbl")):
        os.remove(file)
        print(file)
