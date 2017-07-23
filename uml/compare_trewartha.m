
% show Trewartha classification maps
% written by UML

% load classifications
load trewartha_84_88.mat
load trewartha_11_15.mat

% load the map
land = shaperead('landareas.shp', 'UseGeoCoords', true);

% 'almost' the same colorbar as the one used in Baker 2010
cmap_trew = [[255 255 255];... % masked out
	[128 0 0];... % Ar, tropical rainy
	[192 0 0];... % Am, Tropical monsoonal
	[204 0 0];... % Aw, Tropical wet and dry
	[179 107 0];... % BSh, Tropical-subtopical steppe (hot) 
	[213 128 0];... % BSk, Temperate-boreal steppe (cold)
	[242 146 0];... % BWh, Tropical-subtopical desert (hot) 
	[255 183 74];... % BWk, Temperate-boreal desert (cold)
	[100 132 64];... % Cwa, Subtropical humid (hot)
	[131 159 79];... % Cwb, Subtropical humid (warm)
	[162 186 116];... % Cfa, Subtropical dry winter (hot)
	[201 201 148];... % Cfb, Subtropical dry winter (warm)
	[0 32 64];... % DO, Temperate ocianic % D series colormap is different than Belda
	[0 64 128];... % DCsa, Temperate dry summer (hot)
	[0 100 200];... % DCsb, Temperate dry summer (warm)
	[0 128 255];... % DCwa, Temperate dry winter (hot)
	[72 164 255];... % DCwb, Temperate dry winter (warm)
	[128 0 128];... % DCfa, Temperate humid (hot)
	[208 0 208];... % DCfb, Temperate humid (warm)
	[253 218 19];... % E, Boreal
	[185 185 255];... % Ft, Tundra-Alpine
	[228 247 254];... % Fi, Glacier-Icecap
	]./255;

% Trewartha climate labels
% (from Baker 2010)
labels = { 'nolbl'...
		'Ar' 'Am' 'Aw'...
		'BSh' 'BSk'...
		'BWh' 'BWk'...
		'Cwa' 'Cwb'...
		'Cfa' 'Cfb'...
		'DO'...
		'DCsa' 'DCsb'...
		'DCwa' 'DCwb'...
		'DCfa' 'DCfb'...
		'E'...
		'Ft' 'Fi'...
		};

 % referencing matrix
R_old = [-0.5 0
	0 5/8
	90+0.5 -180-5/8];

% referencing object
R = georasterref('RasterSize', [361 576], 'ColumnsStartFrom', 'north', 'Latlim', [-90 90], ...
		'Lonlim', [-180 180]);

figure(1)
clf
geoshow(tr84_88, cmap_trew, R);
geoshow([land.Lat],[land.Lon], 'Color', 'red')
title('Trewartha Climate Classification, 1984-1988');
colormap(cmap_trew)
h=colorbar;
set(h,'YTickMode','manual','YTick',(256/length(cmap_trew))*[1:length(cmap_trew)],'YTickLabelMode','manual','YTickLabel',labels);

figure(2)
clf
geoshow(tr11_15, cmap_trew, R);
geoshow([land.Lat],[land.Lon], 'Color', 'red')
title('Trewartha Climate Classification, 2011-2015');
colormap(cmap_trew)
h=colorbar;
set(h,'YTickMode','manual','YTick',(256/length(cmap_trew))*[1:length(cmap_trew)],'YTickLabelMode','manual','YTickLabel',labels);

%% trewartha colors
load ../mat/trewartha_84_88.mat
cmap_trew = [[255   255   255];     %  0 masked out
             [128     0     0];     %  1 Ar, tropical rainy
             [192     0     0];     %  2 Am, Tropical monsoonal
             [204     0     0];     %  3 Aw, Tropical wet and dry
             [179   107     0];     %  4 BSh, Tropical-subtopical steppe (hot) 
             [213   128     0];     %  5 BSk, Temperate-boreal steppe (cold)
             [242   146     0];     %  6 BWh, Tropical-subtopical desert (hot) 
             [255   183    74];     %  7 BWk, Temperate-boreal desert (cold)
             [100   132    64];     %  8 Cwa, Subtropical humid (hot)
             [131   159    79];     %  9 Cwb, Subtropical humid (warm)
             [162   186   116];     % 10 Cfa, Subtropical dry winter (hot)
             [201   201   148];     % 11 Cfb, Subtropical dry winter (warm)
             [  0    32    64];     % 12 DO, Temperate ocianic % D series colormap is different than Belda
             [  0    64   128];     % 13 DCsa, Temperate dry summer (hot)
             [  0   100   200];     % 14 DCsb, Temperate dry summer (warm)
             [  0   128   255];     % 15 DCwa, Temperate dry winter (hot)
             [ 72   164   255];     % 16 DCwb, Temperate dry winter (warm)
             [128     0   128];     % 17 DCfa, Temperate humid (hot)
             [208     0   208];     % 18 DCfb, Temperate humid (warm)
             [253   218    19];     % 19 E, Boreal
             [185   185   255];     % 20 Ft, Tundra-Alpine
             [228   247   254];     % 21 Fi, Glacier-Icecap
             [  0     0     0];     % 22
            ]./255 ;

image(tr84_88);
colormap(cmap_trew);
impixelinfo
