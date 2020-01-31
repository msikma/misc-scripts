#!/usr/bin/env python

# Some emulators make segments that start with a number.
# VirtualDub requires segment serial numbers to be at the end of the file,
# otherwise it won't automatically detect all segments. To fix that...
# (C) 2011, Michiel Sikma

import os, re

path = './'
listing = os.listdir(path)
for file in listing:
    matches = re.match(r'([0-9]{3}_)(.+?)\.(.*)', file)
    if matches is not None:
        number = matches.group(1).strip('_')
        name = matches.group(2)
        ext = matches.group(3)
        new_name = '%s_%s.%s' % (name, number, ext)
        print('Renaming %s to %s...' % (file, new_name))
        # uncomment after testing
        # os.rename(path+file, path+new_name)

print('All done.')
