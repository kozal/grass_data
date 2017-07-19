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

tr84_min = tr84_88(tw_qrtr_1+1:tw_qrtr_1*10/9, tw_qrtr_2+1:tw_qrtr_2*10/9);
tr11_min = tr11_15(tw_qrtr_1+1:tw_qrtr_1*10/9, tw_qrtr_2+1:tw_qrtr_2*10/9);
shr_min  = shr(sh_qrtr_1+1:sh_qrtr_1*10/9, sh_qrtr_2+1:sh_qrtr_2*10/9);
nmo_min  = nmo_1_1(nm_half_1+1:nm_half_1*10/9, nm_half_2+1:nm_half_2*10/9);
save ./mat/min.mat tr84_min tr11_min shr_min nmo_min

%% 2.2
% close all

% figure,
% image(tr84_88(tw_qrtr_1+1:tw_qrtr_1*4/3, tw_qrtr_2+1:tw_qrtr_2*4/3));
% colormap(jet(23)) % 0-22
% impixelinfo

% figure,
% image(tr11_15(tw_qrtr_1+1:tw_qrtr_1*4/3, tw_qrtr_2+1:tw_qrtr_2*4/3));
% colormap(jet(23)) % 0-22
% impixelinfo

% figure,
% image(shr(sh_qrtr_1+1:sh_qrtr_1*4/3, sh_qrtr_2+1:sh_qrtr_2*4/3), 'CDataMapping', 'scaled')
% colormap(jet(12)) % 0-11
% impixelinfo

% figure,
% image(nmo_1_1(nm_half_1+1:nm_half_1*4/3, nm_half_2+1:nm_half_2*4/3), 'CDataMapping', 'scaled')
% colormap(jet(20)) % 1-20
% impixelinfo

%%
clearvars
load ./mat/min.mat

