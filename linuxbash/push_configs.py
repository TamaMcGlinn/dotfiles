#!/usr/bin/env python3

import os
from pathlib import Path

CONFIGS = [
    "~/dotfiles",
    "~/vimrc",
    "~/private_vimrc",
    "~/.config/mkproj/project_templates",
]

if __name__ == "__main__":
    print("Pushing to...")
    print("")
    for dir in CONFIGS:
        print(dir)
        config_dir = str(Path(dir).expanduser())
        os.system(f"git -C {config_dir} push")
        print("")
