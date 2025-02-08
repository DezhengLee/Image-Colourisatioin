function KD = genKD(mask, greyImg, sigma1, sigma2, p, KernelFcn)
    idx = find(mask);
    KD = zeros(length(idx));
    sz = size(mask); % Note here may be wrong
    for i = 1:length(idx)
        [xr, xc] = ind2sub(sz, idx(i));
        gamma_x = greyImg(xr, xc, 1);
        
        for j = 1:length(idx)
            [yr, yc] = ind2sub(sz, idx(j));
            gamma_y = greyImg(yr, yc, 1);

            KD(i, j) = reKernal([xr, xc], [yr, yc], gamma_x, gamma_y, ...
                sigma1, sigma2, p, KernelFcn);
        end
    end
end