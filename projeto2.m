#!/usr/local/bin/octave -q

pkg load image;

files = readdir ("input");
frames = [];
hists = [];

for c = 1 : uint64(size(files)(1))

	if strcmp(char(files{c}), ".") == 0 && strcmp(char(files{c}), "..") == 0

		[frames{c}, map, alpha] = imread(strcat("input/", files{c}));
   		disp(strcat("Loaded frame #", int2str(c)));
	
		imwrite(rgb2gray(frames{c}), strcat("output/", files{c}));

   	endif

endfor