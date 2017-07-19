
%% convert tif to mat

nmo = imread('./GLCNMO/gm_lc_v3.tif');
save ./nmo.mat nmo -v7.3

shr = imread('./GLCSHARE/leili/glcshare_dominant1.tif');
save ./shr.mat shr -v7.3

%% show original nmo classes

load ./nmo.mat
cmap2 = [1 1 1
	1 1 1
	1 1 1
	1 1 1
	1 1 1
	1 1 1
	0 0 1 % shrubland blue
	0 0.5 0 % grassland green
	0 0.5 0 % grassland green
	0 0.5 0 % grassland green
	1 1 0 % cropland yellow
	1 1 0 % cropland yellow
	1 1 0 % cropland yellow
	1 1 1
	1 1 1
	1 0.5 0.5 % bare land reddish
	1 0.5 0.5 % bare land reddish
	1 1 1
	1 1 1
	1 1 1];
	
image(nmo, 'CDataMapping', 'scaled')
colormap(cmap2)
axis equal

%% show original share classes

load ./shr.mat
% this should be updared
cmap2 = [1 1 1
	1 0.5 0.5 % bare land reddish
	1 1 0 % cropland yellow
	0 0.5 0 % grassland green
	0 0.5 0 % grassland green
	1 1 1
	1 1 1
	0 0 1 % shrubland blue
	1 1 1
	0 0.5 0 % grassland green
	1 1 1];
	
image(shr, 'CDataMapping', 'scaled')
colormap(cmap2)
axis equal

%% convert nmo

% our codes
% grassland 1, cropland 2, shrubland 3, bare 4, other 5

% NMO classes
%1	Broadleaf Evergreen Forest	11	Cropland
%2	Broadleaf Deciduous Forest	12	Paddy field
%3	Needleleaf Evergreen Forest	13	Cropland / Other Vegetation Mosaic
%4	Needleleaf Deciduous Forest	14	Mangrove
%5	Mixed Forest	15	Wetland
%6	Tree Open	16	Bare area,consolidated(gravel,rock)
%7	Shrub	17	Bare area,unconsolidated (sand)
%8	Herbaceous	18	Urban
%9	Herbaceous with Sparse Tree/Shrub	19	Snow / Ice
%10	Sparse vegetation	20	Water bodies
% nmo2gr = [1, 5
% 	2, 5
% 	3, 5
% 	4, 5
% 	5, 5
% 	6, 5
% 	7, 3
% 	8, 1
% 	9, 1
% 	10, 1
% 	11, 2
% 	12, 2
% 	13, 2
% 	14, 5
% 	15, 5
% 	16, 4
% 	17, 4
% 	18, 5
% 	19, 5
% 	20, 5];

nmo2gr = [5, 5, 5, 5, 5, 5, 3, 1, 1, 1, 2, 2, 2, 5, 5, 4, 4, 5, 5, 5];

load nmo.mat
[h, w] = size(nmo);
for ii=1:h
	for jj=1:w
		nmo(ii, jj) = nmo2gr(nmo(ii, jj));
	end
end
save ./nmo2.mat nmo -v7.3

% grassland 1, cropland 2, shrubland 3, bare 4, other 5
cmap = [0 0.5 0 % grassland green
	1 1 0 % cropland yellow
	0 0 1 % shrubland blue
	1 0.5 0.5 % bare land reddish
	1 1 1]; % other white

image(nmo, 'CDataMapping','scaled')
colormap(cmap)
axis equal

%% convert share

% shr2gr = [1, 5
% 	2, 2
% 	3, 1
% 	4, 5
% 	5, 3
% 	6, 1
% 	7, 5
% 	8, 1
% 	9, 4
% 	10, 5
% 	11, 5];

shr2gr = [5, 2, 1, 5, 3, 1, 5, 1, 4, 5, 5];

load shr.mat
[h, w] = size(shr);

% too south or too north is 0
for ii=1:h
	for jj=1:w
		val = shr(ii, jj);
		if val
			shr(ii, jj) = shr2gr(val);
		else
			shr(ii, jj) = 5;
		end
	end
end

% upsample
shr = repelem(shr, 2, 2);

save ./shr2.mat shr -v7.3

load shr2.mat
image(shr, 'CDataMapping','scaled')
colormap(cmap)
axis equal
