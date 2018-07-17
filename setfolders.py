#!/usr/bin/env python

import os
import sys
from subprocess import call

# This script sets folder colors based on what's inside.

colors = {
  'python': 'violet',
  'php': 'purple',
  'js': 'green',
  'etc': 'orange',
  'c': 'darkblue',
  'pokemon': 'pikachu',
  'article': 'red'
}
icon_base = '/Users/msikma/Pictures/Icons/Folders/'

path = sys.argv[1]

def set_folder(path, type):
  color = colors[type]
  icon = icon_base + color + '.icns'
  call(['fileicon', 'set', path, icon])

dirs = [d for d in os.listdir(path) if os.path.isdir(os.path.join(path, d))]
for dir in dirs:
  dir_path = path + '/' + dir
  dir_files = os.listdir(dir_path)
  if 'package.json' in dir_files:
    set_folder(dir_path, 'js')
  elif ('setup.py' in dir_files) or ('requirements.txt' in dir_files) or ('copyright.rst' in dir_files):
    set_folder(dir_path, 'python')
  elif ('index.php' in dir_files) or ('composer.json' in dir_files):
    set_folder(dir_path, 'python')
  elif 'Makefile' in dir_files:
    set_folder(dir_path, 'c')
  elif 'article' in dir:
    set_folder(dir_path, 'article')
  elif 'poke' in dir:
    set_folder(dir_path, 'pokemon')
  else:
    set_folder(dir_path, 'etc')