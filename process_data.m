clearvars

load ./mat/nmo_1_1.mat
max(nmo_1_1(:))
min(nmo_1_1(:))

%%
clearvars
load ./mat/shr.mat
max(shr(:))
min(shr(:))

% a = 90-89.99583333477331
% b = 1/a
% 
% c = 180-179.99583333333331
% d = 1/c
% 
% e = 1/0.00833333333340

% tic
% cmap = jet(12);
% R_shr = georasterref('RasterSize', [21600 43200], 'ColumnsStartFrom', 'north', 'Latlim', [-90 90], ...
% 		'Lonlim', [-180 180]);
% geoshow(shr,cmap,R_shr)
% toc

cmap = jet(12); % 0-11
R_shr2 = georasterref('RasterSize', [5400 10800], 'ColumnsStartFrom', 'north', 'Latlim', [45 90], ...
		'Lonlim', [-180 -90]);
% geoshow(shr,cmap,R_shr)
tic
geoshow(shr(1:5400, 1:10800),cmap,R_shr2);
toc

tic
image(shr(1:5400, 1:10800), 'CDataMapping', 'scaled')
colormap(cmap_shr)
toc

%%
% russia = load('russia','map','refvec');
% R = refvecToGeoRasterReference(russia.refvec, size(russia.map));
% figure('Color','white')
% worldmap(R.LatitudeLimits,R.LongitudeLimits)
% cmap = jet(1);
% geoshow(russia.map,cmap,R)
