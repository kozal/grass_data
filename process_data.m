clearvars
close all
clc

load ./mat/trewartha_84_88.mat; tr84_88(1,:)=[];
load ./mat/trewartha_11_15.mat; tr11_15(1,:)=[];
load ./mat/structures.mat st_trw 

%% glc_shr
load ./mat/shr.mat
load ./mat/structures.mat st_shr 

tic
stat_shr_8488 = calc_stat(tr84_88, st_trw, shr, st_shr);
toc

tic
stat_shr_1115 = calc_stat(tr11_15, st_trw, shr, st_shr);
toc

%% gm_nmo
clear shr st_shr
load ./mat/structures.mat st_nmo

tw_hlf_row = size(tr84_88,1)/2;
tw_hlf_clm = size(tr84_88,2)/2;

tw_str_row = 1;
tw_end_row = tw_hlf_row;
tw_str_clm = 1;
tw_end_clm = tw_hlf_clm;

%-nmo_1_1-----------------------------
load ./mat/nmo_1_1.mat
% figure,
% image(tr84_88(tw_str_row:tw_end_row,tw_str_clm:tw_end_clm));
% colormap(jet(23)) % 0-22

% figure,
% image(nmo_1_1, 'CDataMapping', 'scaled')
% colormap(jet(20)) % 1-20

tic
stat_nmo_1_1_8488 = calc_stat(tr84_88(tw_str_row:tw_end_row,tw_str_clm:tw_end_clm),...
                              st_trw, nmo_1_1, st_nmo);
toc

tic
stat_nmo_1_1_1115 = calc_stat(tr11_15(tw_str_row:tw_end_row,tw_str_clm:tw_end_clm),...
                              st_trw, nmo_1_1, st_nmo);
toc


%-nmo_1_2-----------------------------
load ./mat/nmo_1_2.mat
tw_str_row = 1;
tw_end_row = tw_hlf_row;
tw_str_clm = tw_hlf_clm+1;
tw_end_clm = tw_hlf_clm*2;

% figure,
% image(tr84_88(tw_str_row:tw_end_row,tw_str_clm:tw_end_clm));
% colormap(jet(23)) % 0-22

% figure,
% image(nmo_1_2, 'CDataMapping', 'scaled')
% colormap(jet(20)) % 1-20

tic
stat_nmo_1_2_8488 = calc_stat(tr84_88(tw_str_row:tw_end_row,tw_str_clm:tw_end_clm),...
                              st_trw, nmo_1_2, st_nmo);
toc

tic
stat_nmo_1_2_1115 = calc_stat(tr11_15(tw_str_row:tw_end_row,tw_str_clm:tw_end_clm),...
                              st_trw, nmo_1_2, st_nmo);
toc

%-nmo_2_1-----------------------------
load ./mat/nmo_2_1.mat
tw_str_row = tw_hlf_row+1;
tw_end_row = tw_hlf_row*2;
tw_str_clm = 1;
tw_end_clm = tw_hlf_clm;

% figure,
% image(tr84_88(tw_str_row:tw_end_row,tw_str_clm:tw_end_clm));
% colormap(jet(23)) % 0-22

% figure,
% image(nmo_2_1, 'CDataMapping', 'scaled')
% colormap(jet(20)) % 1-20

tic
stat_nmo_2_1_8488 = calc_stat(tr84_88(tw_str_row:tw_end_row,tw_str_clm:tw_end_clm),...
                              st_trw, nmo_2_1, st_nmo);
toc

tic
stat_nmo_2_1_1115 = calc_stat(tr11_15(tw_str_row:tw_end_row,tw_str_clm:tw_end_clm),...
                              st_trw, nmo_2_1, st_nmo);
toc

%-nmo_2_2-----------------------------
load ./mat/nmo_2_2.mat
tw_str_row = tw_hlf_row+1;
tw_end_row = tw_hlf_row*2;
tw_str_clm = tw_hlf_clm+1;
tw_end_clm = tw_hlf_clm*2;

% figure,
% image(tr84_88(tw_str_row:tw_end_row,tw_str_clm:tw_end_clm));
% colormap(jet(23)) % 0-22

% figure,
% image(nmo_2_2, 'CDataMapping', 'scaled')
% colormap(jet(20)) % 1-20

tic
stat_nmo_2_2_8488 = calc_stat(tr84_88(tw_str_row:tw_end_row,tw_str_clm:tw_end_clm),...
                              st_trw, nmo_2_2, st_nmo);
toc

tic
stat_nmo_2_2_1115 = calc_stat(tr11_15(tw_str_row:tw_end_row,tw_str_clm:tw_end_clm),...
                              st_trw, nmo_2_2, st_nmo);
toc

%-total-----------------------------
stat_nmo_8488 = stat_nmo_1_1_8488 + stat_nmo_1_2_8488 + ... 
                stat_nmo_2_1_8488 + stat_nmo_2_2_8488;

stat_nmo_1115 = stat_nmo_1_1_1115 + stat_nmo_1_2_1115 + ...
                stat_nmo_2_1_1115 + stat_nmo_2_2_1115;
