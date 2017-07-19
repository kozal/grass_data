clearvars

load ./mat/trewartha_84_88.mat
load ./mat/trewartha_11_15.mat
load ./mat/shr.mat
load ./mat/nmo_1_1.mat

tr84_88(1,:)=[];
tr11_15(1,:)=[];

tw_qrtr_1 = size(tr84_88,1)/4;
sh_qrtr_1 = size(shr,1)/4;
nm_half_1 = size(nmo_1_1,1)/2;

tw_qrtr_2 = size(tr84_88,2)/4;
sh_qrtr_2 = size(shr,2)/4;
nm_half_2 = size(nmo_1_1,2)/2;

%% 1.1
close all

figure,
image(tr84_88(1:tw_qrtr_1, 1:tw_qrtr_2));
colormap(jet(23)) % 0-22
impixelinfo

figure,
image(tr11_15(1:tw_qrtr_1, 1:tw_qrtr_2));
colormap(jet(23)) % 0-22
impixelinfo

figure,
image(shr(1:sh_qrtr_1, 1:sh_qrtr_2), 'CDataMapping', 'scaled')
colormap(jet(12)) % 0-11
impixelinfo

figure,
image(nmo_1_1(1:nm_half_1, 1:nm_half_2), 'CDataMapping', 'scaled')
colormap(jet(20)) % 1-20
impixelinfo

%% 1.2
close all

figure,
image(tr84_88(1:tw_qrtr_1, tw_qrtr_2+1:tw_qrtr_2*2));
colormap(jet(23)) % 0-22
impixelinfo

figure,
image(tr11_15(1:tw_qrtr_1, tw_qrtr_2+1:tw_qrtr_2*2));
colormap(jet(23)) % 0-22
impixelinfo

figure,
image(shr(1:sh_qrtr_1, sh_qrtr_2+1:sh_qrtr_2*2), 'CDataMapping', 'scaled')
colormap(jet(12)) % 0-11
impixelinfo

figure,
image(nmo_1_1(1:nm_half_1, nm_half_2+1:nm_half_2*2), 'CDataMapping', 'scaled')
colormap(jet(20)) % 1-20
impixelinfo

%% 2.1
close all

figure,
image(tr84_88(tw_qrtr_1+1:tw_qrtr_1*2, 1:tw_qrtr_2));
colormap(jet(23)) % 0-22
impixelinfo

figure,
image(tr11_15(tw_qrtr_1+1:tw_qrtr_1*2, 1:tw_qrtr_2));
colormap(jet(23)) % 0-22
impixelinfo

figure,
image(shr(sh_qrtr_1+1:sh_qrtr_1*2, 1:sh_qrtr_2), 'CDataMapping', 'scaled')
colormap(jet(12)) % 0-11
impixelinfo

figure,
image(nmo_1_1(nm_half_1+1:nm_half_1*2, 1:nm_half_2), 'CDataMapping', 'scaled')
colormap(jet(20)) % 1-20
impixelinfo

%% 2.2
close all

figure,
image(tr84_88(tw_qrtr_1+1:tw_qrtr_1*2, tw_qrtr_2+1:tw_qrtr_2*2));
colormap(jet(23)) % 0-22
impixelinfo

figure,
image(tr11_15(tw_qrtr_1+1:tw_qrtr_1*2, tw_qrtr_2+1:tw_qrtr_2*2));
colormap(jet(23)) % 0-22
impixelinfo

figure,
image(shr(sh_qrtr_1+1:sh_qrtr_1*2, sh_qrtr_2+1:sh_qrtr_2*2), 'CDataMapping', 'scaled')
colormap(jet(12)) % 0-11
impixelinfo

figure,
image(nmo_1_1(nm_half_1+1:nm_half_1*2, nm_half_2+1:nm_half_2*2), 'CDataMapping', 'scaled')
colormap(jet(20)) % 1-20
impixelinfo

%% 3.2
close all
clear nmo_1_1
load ./mat/nmo_2_1.mat


figure,
image(tr84_88(tw_qrtr_1*2+1:tw_qrtr_1*3, tw_qrtr_2+1:tw_qrtr_2*2));
colormap(jet(23)) % 0-22
impixelinfo

figure,
image(tr11_15(tw_qrtr_1*2+1:tw_qrtr_1*3, tw_qrtr_2+1:tw_qrtr_2*2));
colormap(jet(23)) % 0-22
impixelinfo

figure,
image(shr(sh_qrtr_1*2+1:sh_qrtr_1*3, sh_qrtr_2+1:sh_qrtr_2*2), 'CDataMapping', 'scaled')
colormap(jet(12)) % 0-11
impixelinfo

figure,
image(nmo_2_1(1:nm_half_1, nm_half_2+1:nm_half_2*2), 'CDataMapping', 'scaled')
colormap(jet(20)) % 1-20
impixelinfo
