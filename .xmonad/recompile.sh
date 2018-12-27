#!/usr/bin/env bash

killall xmobar

cd "$(dirname "$0")"
python ../copydotfiles.py
python ./recompile.py
