clearvars
close all
clc

%% open nmo
clearvars
nmo_1_1 = imread('./gm_nmo/gm_lc_v3_1_1.tif');
save ./mat/nmo_1_1.mat nmo_1_1 -v7.3
clearvars
nmo_1_2 = imread('./gm_nmo/gm_lc_v3_1_2.tif');
save ./mat/nmo_1_2.mat nmo_1_2 -v7.3
clearvars
nmo_2_1 = imread('./gm_nmo/gm_lc_v3_2_1.tif');
save ./mat/nmo_2_1.mat nmo_2_1 -v7.3
clearvars
nmo_2_2 = imread('./gm_nmo/gm_lc_v3_2_2.tif');
save ./mat/nmo_2_2.mat nmo_2_2 -v7.3


%% open shr
clearvars
shr = imread('./glc_share/glc_shv10_DOM.Tif');
save ./mat/shr.mat shr -v7.3


%% cmap
clearvars
cmap_nmo = [1   1   1
            1   1   1
            1   1   1
            1   1   1
            1   1   1
            1   1   1
            0   0   1                   % shrubland blue
            0   0.5 0                   % grassland green
            0   0.5 0                   % grassland green
            0   0.5 0                   % grassland green
            1   1   0                   % cropland yellow
            1   1   0                   % cropland yellow
            1   1   0                   % cropland yellow
            1   1   1
            1   1   1
            1   0.5 0.5                 % bare land reddish
            1   0.5 0.5                 % bare land reddish
            1   1   1
            1   1   1
            1   1   1];
save ./mat/cmap_nmo.mat cmap_nmo

cmap_shr = [1   1   1
            1   0.5 0.5                 % bare land reddish
            1   1   0                   % cropland yellow
            0   0.5 0                   % grassland green
            0   0.5 0                   % grassland green
            1   1   1
            1   1   1
            0   0   1                   % shrubland blue
            1   1   1
            0   0.5 0                   % grassland green
            1   1   1];
save ./mat/cmap_shr.mat cmap_shr

cmap_grass = [0   0.5 0                 % grassland green
              1   1   0                 % cropland yellow
              0   0   1                 % shrubland blue
              1   0.5 0.5               % bare land reddish
              1   1   1];               % other white
save ./mat/cmap_grass.mat cmap_grass
