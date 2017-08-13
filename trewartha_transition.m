clearvars
close all
clc

load ./mat/trewartha_84_88.mat; tr84_88(1,:)=[];
load ./mat/trewartha_11_15.mat; tr11_15(1,:)=[];
% load ./mat/structures.mat st_trw 

% prepare struct
classes_84  = unique(tr84_88);
classes_11  = unique(tr11_15);

struc_trw1115 = struct('classes',classes_11, 'min_cls',min(classes_11),...
    'max_cls',max(classes_11));

struc_trw8488 = struct('classes',classes_84, 'min_cls',min(classes_84),...
    'max_cls',max(classes_84));

struc_trw1115.trw_row_res = 1;
struc_trw1115.trw_clm_res = 1;

%% class transition
step_classes = [3, 5, 17, 18, 20];
non_step_classes = [1, 2, 7, 12, 19];

%%
% assume class from 0 to max_cls without blanks
num_cls_trw8488 = struc_trw8488.max_cls+1;
num_cls_trw1115 = struc_trw1115.max_cls+1;

% create stat matrix
trw1115_stats = zeros(num_cls_trw8488, num_cls_trw1115);

% create transition map
trw1115_map = zeros(size(tr84_88));

for row_i = 1:size(tr84_88,1)
    row_start = struc_trw1115.trw_row_res*(row_i-1)+1;
    row_end   = struc_trw1115.trw_row_res*(row_i);
    
    for clm_i = 1:size(tr84_88,2)
        clm_start = struc_trw1115.trw_clm_res*(clm_i-1)+1;
        clm_end   = struc_trw1115.trw_clm_res*(clm_i);
        
        x = tr11_15(row_start:row_end, clm_start:clm_end);
        x_row_dbl = double(x(:)');
        [pix_cnt, pix_cls]=histcounts(x_row_dbl,[unique(x_row_dbl),...
            num_cls_trw1115]);                   % add as last bin edge
        
        trw_cls8488 = tr84_88(row_i,clm_i)+1;    % starts from 0 add 1

        for j = 1:numel(unique(x_row_dbl))
            trw_cls1115 = pix_cls(j)+1;          % starts from 0 add 1
            trw1115_stats(trw_cls8488,trw_cls1115) = ...
                trw1115_stats(trw_cls8488,trw_cls1115)+pix_cnt(j);
        end
        if tr84_88(row_i,clm_i) ~= 0            % not unlabeled
            if (ismember((trw_cls8488-1), step_classes) && ...
                    ismember((trw_cls1115-1), non_step_classes))
                trw1115_map(row_i,clm_i) = 2;   % mark as step to grass
            else
                trw1115_map(row_i,clm_i) = 1;   % mark as ignored
            end
        end
    end
end

%%
figure,
image(tr84_88, 'CDataMapping', 'scaled')
colormap(jet(22)) % 0-21
title('Trewartha 84 - 88')

%%
cmap_trew_change = [[228 247 254];...   % masked out
                    [255 200 90];...    % Ignored
                    [0 130 0];...       % Step to Grass
                    ]./255;

figure,
image(trw1115_map, 'CDataMapping', 'scaled')
colormap(cmap_trew_change),
title('Change in Trewartha Classes')
cb = colorbar('Ticks',[0,1,2],...
         'TickLabels',{'masked out','Ignored','Step to Grass'});
% set(cb,'position',[0.90 .1 .05 .3])


