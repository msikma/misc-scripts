#!/usr/bin/env python

import os
import sys

path = sys.argv[1]
if os.path.exists(path):
  print(os.path.basename(path))

for subdir, dirs, files in os.walk(path):
  for file in files:
    print(os.path.join(subdir, file))