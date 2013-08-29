#!/bin/bash

# Builds list of files for Manifest.py
find . -regextype posix-extended -iregex ".*(\.ngc|\.vhd|\.ucf)" | sort | sed -e 's@\(.*\)@\"\1\",@g' -e 's@\.\/@@g' > pre_manifest.txt
