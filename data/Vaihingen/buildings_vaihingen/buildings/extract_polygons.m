

central_point = false(512);
central_point(256,256) = true;
data = [];
for num = 1:168
    gt = imread(['building_gt_', num2str(num,'%0.3d'), '.tif']); 
    im = imread(['building_', num2str(num,'%0.3d'), '.tif']); 
    buildings = gt(:,:,3)==255 & gt(:,:,2) == 0;
    the_building = imreconstruct(central_point,buildings);
    B = bwboundaries(the_building);
    [ps,ix] = dpsimplify(B{1},3);
    subplot(3,3,mod(num,9)+1);
    imagesc(im);
    hold on
    plot(ps(:,2),ps(:,1),'-o','LineWidth',3,'MarkerEdgeColor',[1,1,0]);
    hold off
    xticks([])
    yticks([])
    pause(0.01);
    data(num,1) = double(size(ps,1));
    pst = ps';
    pst = pst(:);
    for i = 1:numel(pst)
        data(num,1+i) = pst(i);
    end
    imwrite(the_building,['building_mask_',num2str(num,'%0.3d'),'.tif']);
    imwrite(buildings,['all_buildings_mask_',num2str(num,'%0.3d'),'.tif']);
end
csvwrite('polygons.csv',data);