#!/bin/bash

make profile-build numa=no prefetch=no pext=yes
# the last two options reduce file size a just enough to get to 64,920 bytes

echo "binary size:"
ls -lh cfish | awk '{print $5}'

strip -s cfish
echo "binary size after strip:"
ls -lh cfish | awk '{print $5}'

tar cf cfish.tar main.py cfish

zopfli --i100 cfish.tar

echo "Compressed binary size zopfli:"
ls -l cfish.tar.gz | awk '{print $5}'

# 65,536 bytes maximum

# 7z a cfish.tar.7z cfish.tar -mx=9

# echo "Compressed binary size zopfli:"
# ls -lh cfish.tar.7z | awk '{print $5}'