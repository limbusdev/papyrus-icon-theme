#! /usr/bin/env python3

# Usage: ./new_color_script.py "#ffffff" "#000000"

import sys
import os
import subprocess
import glob

# Textersetzung mit sed:
#   sed -i 's/Original-Text/Neuer-Text/g' folder.svg 

stop1 = sys.argv[1]
stop2 = sys.argv[2]

print('sed has to be installed!')
svg_list = glob.glob('*.svg')
for input_svg in svg_list:
    print('Processing ' + input_svg)
    sed_command = ("sed -i 's/#3465a4/" + stop1 + "/g' " + input_svg)
    print(sed_command)
    conversion1 = subprocess.Popen(sed_command, shell=True)
    conversion1.wait()
    sed_command = ("sed -i 's/#729fcf/" + stop2 + "/g' " + input_svg)
    print(sed_command)
    conversion2 = subprocess.Popen(sed_command, shell=True)
    conversion2.wait()

