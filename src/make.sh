#!/bin/bash

make profile-build

strip -s cfish

tar cf cfish.tar main.py cfish
7z a cfish.tar.7z cfish.tar -mx=9

echo "Compressed binary size zopfli:"
ls -lh cfish.tar.7z | awk '{print $5}'