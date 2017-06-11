function [] = colorcomp( paleta )
%COLORCOMP afiseaza o figura comparativa pentru culori
%
%   colorcomp(p) va afisa culorile din p
%
%   INTRARE: paleta = matrice Nx3 de culori RGB
%

img = zeros(size(paleta,1)*20, 100, 3);
for i = 1 : size(paleta,1)*20
    for j = 1 : 100
        if i == size(paleta,1)*20
            img(i,j,:)=paleta(floor(i/20),:);
        else
          img(i,j,:) = paleta(floor(i / 20 + 1), :);
        end
    end
end

img = uint8(img);

imshow(img);

end

