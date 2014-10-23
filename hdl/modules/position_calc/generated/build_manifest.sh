#!/bin/bash

DIRS=$(find . -maxdepth 1 -mindepth 1 -type d -printf '%f\n')
TOP_DIR=$(pwd)

MANIFEST_PROLOGUE="files = ["
MANIFEST_EPILOGUE="];"

# Builds list of files for Manifest.py
for dir in $DIRS
do
  cd $dir
  echo $MANIFEST_PROLOGUE > Manifest.py

  # Find all vhd, ngc and v files and put them in a Manifest format
  find . -regextype posix-extended -iregex ".*(\.ngc|\.vhd|\.v)" | \
  sort | \
  sed -e 's@\(.*\)@\"\1\",@g' -e 's@\.\/@@g' >> \
  Manifest.py

  # Delete last comma
  sed -ie '$s@.$@@' Manifest.py
  echo $MANIFEST_EPILOGUE >> Manifest.py

  echo "Created Manifest file in "$TOP_DIR/$dir
  cd $TOP_DIR
done
