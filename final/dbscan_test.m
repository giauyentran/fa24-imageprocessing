
% dbscan_mine("images/alberta/mining_2020.png", "dbscan_plots/alberta.png", 0.055, 20);
% dbscan_mine("images/chuquicamata/2020-12-31.png", "dbscan_plots/chuquicamata.png", 0.1, 100);
dbscan_mine("images/garzweiler/2020-12-31.png", "dbscan_plots/garzweuler.png", 0.04, 110);
% dbscan_mine("images/grasberg/2020-12-31.png", "dbscan_plots/grasberg", 0.06, 40);
% dbscan_mine("images/mirny/2020-12-31.png", "dbscan_plots/mirny_", 0.06, 240); % 0.04 80 0.05 160


function dbscan_mine(filename, savefile, eps, minpts)
    
    im = imread(filename);
    img = imresize(im, 0.5);
    figure(1);
    imshow(img)
    img = im2double(img);
    size(img)

    hsv = rgb2hsv(img);
    h = hsv(:,:,1);
    h = reshape(h.',1,[]);
    s = hsv(:,:,2);
    s = reshape(s.',1,[]);
    v = hsv(:,:,3);
    v = reshape(v.',1,[]);

    x = 1:size(img, 2);
    x = repmat(x, size(img, 1), 1);
    x = reshape(x.',1,[]);

    y = transpose(1:size(img, 1));
    y = repmat(y, 1, size(img, 2));
    y = reshape(y.',1,[]);
    
    h_scale = h/max(h);
    s_scale = s/max(s);
    v_scale = v/max(v);
    x_scale = x/max(x);
    y_scale = y/max(y);

    data = [h_scale; s_scale; v_scale; x_scale; y_scale]';

    [idx, corepts] = dbscan(data, eps, minpts); % 0.1 30
    % scatter3(h_scale, s_scale, v_scale)
    % scatter3(y_scale, x_scale, v_scale, [], idx, 'filled')
    % colorbar
    % colormap jet
    % hold on
    figure(2);
    scatter(x_scale, -y_scale, [], idx, 'filled')
    colorbar
    C = jet(max(idx)-min(idx));
    C(1,:) = [0, 0, 0];
    C(2,:) = [0, 0, 0];
    colormap(C)
    title("eps: " + string(eps) + " minpts: " + string(minpts))
    exportgraphics(gcf, savefile+string(eps) + "_" + string(minpts)+".png", "Resolution",150)

end