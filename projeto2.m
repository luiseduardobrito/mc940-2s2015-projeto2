#!/usr/local/bin/octave -q

pkg load image;

files = readdir ("input");
frames = [];
hists = [];
dists = [];

SIZE = uint64(size(files)(1))

for c = 1 : SIZE

	if strcmp(char(files{c}), ".") == 0 && strcmp(char(files{c}), "..") == 0

		[frames{c}, map, alpha] = imread(strcat("input/", files{c}));

   		gray = rgb2gray(frames{c});
		imwrite(gray, strcat("output/", files{c}));

		hist{c} = imhist(gray);
		imwrite(hist{c}, strcat("hist/", files{c}));

   	endif

endfor

disp("Loaded all histograms");

before = false;
st = 4;

for c = st : SIZE;

	index = c - st + 1;

	before = frames{c-1};
	current = frames{c};

	diffs{index} = mean(abs(imhist(current) - imhist(before)));

endfor

disp("Loaded all diffs");

plsize = uint64(size(diffs)(2))
pl = plot(cell2mat(diffs)(1,:));
imwrite(pl, "result/diffs.png");