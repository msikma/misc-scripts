#!/usr/bin/env python3

import os
import sys
from subprocess import call

# This script sets folder colors based on what's inside.
colors = {
  'python': 'pink',
  'php': 'violet',
  'js': 'green',
  'etc': 'orange',
  'c': 'darkblue',
  'pokemon': 'pikachu',
  'article': 'red'
}
icon_bases = [
  '/Users/msikma/Projects/osx-folders/icns',
  '/Users/msikma/Projects/dada-icons/icns'
]

# Make a list of all icons: {<name>: <path>}.
icon_groups = [
  [[os.path.basename(d).replace('.icns', ''), base + '/' + d]
    for d in os.listdir(base)
    if '.icns' in d]
  for base in icon_bases
]
icons = {}
for group in icon_groups:
  for icon in group:
    icons[icon[0]] = icon[1]

# Check that we have a path.
if len(sys.argv) < 2:
  print('Usage: colorfolders.py PATH')
  exit()

path = sys.argv[1]

def set_folder(path, type):
  color = colors[type]
  icon = icons[color]
  print('Setting \x1b[31m{}\x1b[0m to \x1b[34m{}\x1b[0m (type: \x1b[32m{}\x1b[0m)'.format(os.path.basename(path), color, type))
  call(['fileicon', 'set', path, icon])

dirs = [d for d in os.listdir(path) if os.path.isdir(os.path.join(path, d))]
for dir in dirs:
  dir_path = path.rstrip('/') + '/' + dir
  dir_files = os.listdir(dir_path)
  if 'package.json' in dir_files:
    set_folder(dir_path, 'js')
  elif ('setup.py' in dir_files) or ('requirements.txt' in dir_files) or ('copyright.rst' in dir_files):
    set_folder(dir_path, 'python')
  elif ('index.php' in dir_files) or ('composer.json' in dir_files):
    set_folder(dir_path, 'php')
  elif 'Makefile' in dir_files:
    set_folder(dir_path, 'c')
  elif 'article' in dir:
    set_folder(dir_path, 'article')
  elif 'poke' in dir:
    set_folder(dir_path, 'pokemon')
  else:
    set_folder(dir_path, 'etc')