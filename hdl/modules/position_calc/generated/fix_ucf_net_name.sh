#!/bin/bash

# Fix .ucf NET names

sed -i -e 's@\(NET *\"\)@\1\*position_calc\/\*\/@g' \
    -e 's@\(AFTER *\"\)@\1\*position_calc\/\*\/@g' \
    -e 's@\(BEFORE *\"\)@\1\*position_calc\/\*\/@g' \
    *.ucf
