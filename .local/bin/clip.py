#!/usr/bin/env python3

import os

result = os.system("ls -la")

# result = os.system("echo file " "$f" "")
for i in fruits:
    print(i)
result = os.system(
    "ffprobe -i '$f' -show_entries format=duration -v quiet -of csv='p=0'"
)

print(result)
