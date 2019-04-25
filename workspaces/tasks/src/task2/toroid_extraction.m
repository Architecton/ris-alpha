load ime_fajla.txt
A = ime_fajla;
bin_A = (A < 1500 & A > 600);
bin_A = imclose(bin_A, strel('disk', 22));
bin_A = imfill(bin_A,'holes');
imagesc(bin_A);


props = regionprops(bin_A, 'Area', 'Perimeter', 'Centroid');
allAreas = [props.Area];
allPerimeters = [props.Perimeter];
circularities = (4 * pi * allAreas) ./ allPerimeters .^2;