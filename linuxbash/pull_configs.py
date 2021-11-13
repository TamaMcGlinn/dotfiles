#!/usr/bin/env python3

import os
from pathlib import Path
from push_configs import CONFIGS

if __name__ == "__main__":
    print("Pulling from...")
    print("")
    for dir in CONFIGS:
        print(dir)
        config_dir = str(Path(dir).expanduser())
        os.system(f"git -C {config_dir} pull")
        print("")
