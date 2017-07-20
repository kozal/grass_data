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

%% structures
clearvars
% 
load ./mat/trewartha_84_88.mat; tr84_88(1,:)=[];
load ./mat/trewartha_11_15.mat; tr11_15(1,:)=[];
load ./mat/shr.mat
load ./mat/nmo_1_1.mat

classes_84  = unique(tr84_88);
classes_11  = unique(tr11_15);
classes_shr = unique(shr);
classes_nmo = unique(nmo_1_1);

shr2trw_row_res = size(shr,1)/size(tr84_88,1);
shr2trw_clm_res = size(shr,2)/size(tr84_88,2);

nmo2trw_row_res = size(nmo_1_1,1)/size(tr84_88,1) * 2;
nmo2trw_clm_res = size(nmo_1_1,2)/size(tr84_88,2) * 2;


% st_tr_84 = struct('classes',classes_84,...
%     'min_cls',min(classes_84),'max_cls',max(classes_84));
% 
% st_tr_11 = struct('classes',classes_11,...
%     'min_cls',min(classes_11),'max_cls',max(classes_11));

st_trw = struct('classes',classes_11, 'min_cls',min(classes_11),...
    'max_cls',max(classes_11));

st_shr = struct('classes',classes_shr, 'min_cls',min(classes_shr),...
    'max_cls',max(classes_shr), 'trw_row_res',shr2trw_row_res, ...
    'trw_clm_res',shr2trw_clm_res);

st_nmo = struct('classes',classes_nmo, 'min_cls',min(classes_nmo),...
    'max_cls',max(classes_nmo), 'trw_row_res',nmo2trw_row_res, ...
    'trw_clm_res',nmo2trw_clm_res);

save ./mat/structures.mat st_trw st_shr st_nmo
% save ./mat/structures.mat st_tr_84 st_tr_11 st_shr st_nmo
