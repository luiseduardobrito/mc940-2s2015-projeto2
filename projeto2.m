#!/usr/local/bin/octave -q

files = readdir ("input");
frames = [];

for c = 1 : uint64(size(files)(1))

	if strcmp(char(files{c}), ".") == 0 && strcmp(char(files{c}), "..") == 0
		frames{c} = imread(strcat("input/", files{c}));
   		disp(strcat("Loaded frame #", int2str(c)));
   	endif

endfor