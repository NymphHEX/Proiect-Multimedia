function [ pixel, caz ] = embed( vec_imagine, pixel_watermark, paleta )
%EMBED combina un pixel de imagine RGB cu unul de watermark binar
%
%   p = embed(h, w) va combina pixelii h si w in pixel-ul p
%
%   INTRARE:     vec_imagine = vecini pixel imagine RGB (matrice 3x3)
%            pixel_watermark = pixel imagine watermark binara
%                     paleta = lista de culori
%   IESIRE:            pixel = pixel combinat
%

threshold = 500;
    
pixel_imagine = vec_imagine(2,2,:);

% Calculam culoarea cea mai apropiata.
I = minpalette(pixel_imagine, paleta);
c_min = paleta(I, :);

% Calculam culoarea a 2-a cea mai apropiata.
Inext = min(I + 1, size(paleta, 1));
c_next = paleta(Inext, :);

% Calculam hMean.
h_l = vec_imagine(2, 1, :);
h_a = vec_imagine(1, 2, :);
h_mean = floor((h_l + h_a) ./ 2);

% Verificam cazurile.
if mod(pixel_watermark + I, 2) == 0
    % Cazul 1.
    caz = 1;
    pixel = c_min;
elseif sed(pixel_imagine, c_next) - sed(pixel_imagine, c_min) <= threshold
    % Cazul 2.
    caz = 2;
    pixel = c_next;
elseif sed(pixel_imagine, h_mean) < sed(pixel_imagine, c_next)
    % Cazul 3.
    caz = 3;
    pixel = paleta(max(pixel_watermark * size(paleta,1), 1), :);
else
    % Cazul 4.
    caz = 4;
    pixel = c_next;
end

end

