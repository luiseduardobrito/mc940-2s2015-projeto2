#!/usr/local/bin/octave -qf

dir = "input"
files = readdir (dir)
imshow(files(0))