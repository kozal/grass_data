clearvars
close all

load ./mat/trewartha_84_88.mat; tr84_88(1,:)=[];
% load ./mat/trewartha_11_15.mat; tr11_15(1,:)=[];
load ./mat/shr.mat

% classes_84  = unique(tr84_88);
% classes_shr = unique(shr);  % takes >10 secs. load structures.mat
load ./mat/structures.mat st_trw st_shr 

%%
% shr2trw_rows = 60;
% shr2trw_clms = 75;

% assume class from 0 to max_cls without blanks
num_cls_trw = st_trw.max_cls+1;
num_cls_shr = st_shr.max_cls+1;
% create stat matrix
glc_shr_stats = zeros(num_cls_trw,num_cls_shr);


%%

% 
% tw_qrtr_1 = size(tr84_88,1)/4;
% sh_qrtr_1 = size(shr,1)/4;
% nm_half_1 = size(nmo_1_1,1)/2;
% 
% tw_qrtr_2 = size(tr84_88,2)/4;
% sh_qrtr_2 = size(shr,2)/4;
% nm_half_2 = size(nmo_1_1,2)/2;
% 
% tr84_min = tr84_88(tw_qrtr_1+1:tw_qrtr_1*10/9, tw_qrtr_2+1:tw_qrtr_2*10/9);
% tr11_min = tr11_15(tw_qrtr_1+1:tw_qrtr_1*10/9, tw_qrtr_2+1:tw_qrtr_2*10/9);
% shr_min  = shr(sh_qrtr_1+1:sh_qrtr_1*10/9, sh_qrtr_2+1:sh_qrtr_2*10/9);
% nmo_min  = nmo_1_1(nm_half_1+1:nm_half_1*10/9, nm_half_2+1:nm_half_2*10/9);
% save ./mat/min.mat tr84_min tr11_min shr_min nmo_min

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

clc
clearvars
close all
load ./mat/min.mat
load ./mat/structures.mat st_trw st_shr 

stat_shr1 = calc_stat(tr84_min, st_trw, shr_min, st_shr);


shr2trw_rows = 60;
shr2trw_clms = 75;

stat_shr2 = zeros(23,12);

for row_i = 1:size(tr84_min,1)
% for row_i = 1:2
    row_start = shr2trw_rows*(row_i-1)+1;
    row_end   = shr2trw_rows*(row_i);
    
    for clm_i = 1:size(tr84_min,2)
%     for clm_i = 1:11
        clm_start = shr2trw_clms*(clm_i-1)+1;
        clm_end   = shr2trw_clms*(clm_i);
        
        x = shr_min(row_start:row_end, clm_start:clm_end);
        x_row_dbl = double(x(:)');
%         [a1,b1]=hist(x_row_dbl,unique(x_row_dbl));
        [a2,b2]=histcounts(x_row_dbl,[unique(x_row_dbl), 12]);
        
        trw_cls = tr84_min(row_i,clm_i)+1;          % starts from 0 add 1
%         for i = 1:numel(b1)
%             shr_cls = b1(i)+1;                      % starts from 0 add 1
%             stat_shr(trw_cls,shr_cls) = stat_shr(trw_cls,shr_cls) + a1(i);
%         end
        for j = 1:numel(unique(x_row_dbl))
            shr_cls = b2(j)+1;                      % starts from 0 add 1
            stat_shr2(trw_cls,shr_cls) = stat_shr2(trw_cls,shr_cls) + a2(j);
        end
    end
end

isequal(stat_shr, stat_shr2)



%%
% row_start = 1;
% row_end   = 60;
% clm_start = 751;
% clm_end   = 825;
% 
% x = shr_min(row_start:row_end, clm_start:clm_end);
% x_row_dbl = double(x(:)');
% [a1,b1]=hist(x_row_dbl,unique(x_row_dbl))
% [a2,b2]=histcounts(x_row_dbl,[unique(x_row_dbl), 12])
% 
% clm_start = 826;
% clm_end   = 900;
% x = shr_min(row_start:row_end, clm_start:clm_end);
% x_row_dbl = double(x(:)');
% [a1,b1]=hist(x_row_dbl,unique(x_row_dbl))
% [a2,b2]=histcounts(x_row_dbl,[unique(x_row_dbl), 12])



% emptyCell{1,1} = magic(5)
% emptyCell = cell(23,12)
% 
% C = {'one', 'two', 'three'; 
%      1, 2, 3}
%  
% field = 'f';
% value = {'some text';
%          [10, 20, 30];
%          magic(5)};
% s = struct(field,value)
% s.f
