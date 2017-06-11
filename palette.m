function [ paleta, imagine ] = palette( imagine )
%PALETTE genereaza o paleta de culori principale a imaginii.
%
%   pal = palette(img) va intoarce paleta de culori principale ale img.
%
%   INTRARE: imagine = imaginea sursa RGB
%   IESIRE:   paleta = lista de culori RGB
%            imagine = imagine cuantizata dupa noua paleta
%

inImg = imagine;
N = 64;

s_img = size(inImg);

%K-Means
r = inImg(:,:,1);
g = inImg(:,:,2);
b = inImg(:,:,3);
inputImg = zeros((s_img(1) * s_img(2)), 3);
inputImg(:,1) = r(:);
inputImg(:,2) = g(:);
inputImg(:,3) = b(:);
inputImg = double(inputImg);
[idx, C] = kmeans(inputImg, N, 'EmptyAction', 'singleton');
paletteZ = round(C);

%Color Mapping
idx = uint8(idx);
outImg = zeros(s_img(1),s_img(2),3);
temp = reshape(idx, [s_img(1) s_img(2)]);
for i = 1 : 1 : s_img(1)
    for j = 1 : 1 : s_img(2)
        outImg(i,j,:) = paletteZ(temp(i,j),:);
    end
end

paleta = paletteZ;
imagine = uint8(outImg);

end
