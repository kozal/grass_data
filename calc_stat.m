function glc_stats = calc_stat(trw_img, struc_trw, glc_img, struc_glc)
%calc_stat - Calculating stats between two classification results
%
% Syntax: glc_stats = calc_stat(input)
%
% This function takes two classification images as input as well as 
% information structures about the images. It assumes that the classes
% starts from 0 and continues to max_cls given in info struct.


    % assume class from 0 to max_cls without blanks
    num_cls_trw = struc_trw.max_cls+1;
    num_cls_glc = struc_glc.max_cls+1;
    % create stat matrix
    glc_stats = zeros(num_cls_trw, num_cls_glc);

    for row_i = 1:size(trw_img,1)
        row_start = struc_glc.trw_row_res*(row_i-1)+1;
        row_end   = struc_glc.trw_row_res*(row_i);
        
        for clm_i = 1:size(trw_img,2)
            clm_start = struc_glc.trw_clm_res*(clm_i-1)+1;
            clm_end   = struc_glc.trw_clm_res*(clm_i);
            
            x = glc_img(row_start:row_end, clm_start:clm_end);
            x_row_dbl = double(x(:)');
            [pix_cnt, pix_cls]=histcounts(x_row_dbl,[unique(x_row_dbl),...
                num_cls_glc]);                       % add as last bin edge
            
            trw_cls = trw_img(row_i,clm_i)+1;        % starts from 0 add 1

            for j = 1:numel(unique(x_row_dbl))
                glc_cls = pix_cls(j)+1;              % starts from 0 add 1
                glc_stats(trw_cls,glc_cls) = glc_stats(trw_cls,glc_cls)+...
                    pix_cnt(j);
            end
        end
    end

end
