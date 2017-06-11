%% Citire imagine Watermark.
% Imaginea watermark contine doar culori binare (0 si 1) si este
% de o marime [w, h].
watermark = imread('watermark1.bmp');
[w, h, ~] = size(watermark);

%% Citire imagine tinta.
% Imaginea tinta este o imagine colorata RGB de dimensiune [W, H].
image = imread('Lena.tiff');
[W, H, ~] = size(image);

%% Criptare imagine Watermark.
watermark = enc(watermark);

%% Generare harta Watermark.
harta = genmap(w, h, W, H);

%% Gasire paleta principala de culori.
[paleta, imagine] = palette(image);
paleta = sortpalette(paleta);

%% Inserarea watermark-ului in imagine.
debug = [0 0 0 0];
for i = 1 : w
    for j = 1 : h
        % Gasirea coordonatelor in imagine.
        a = harta(i, j, 1);
        b = harta(i, j, 2);
        % Calculare vecini.
        v = zeros(3, 3, 3);
        v(:,:,1) = neighbours(image(:,:,1), [a b], 3);
        v(:,:,2) = neighbours(image(:,:,2), [a b], 3);
        v(:,:,3) = neighbours(image(:,:,3), [a b], 3);
        % Calculare pixel combinat.
        [c, caz] = embed(v, watermark(i, j), paleta);
        % debug caz
        debug(caz) = debug(caz) + 1;
        % Formare imagine finala.
        imagine(a, b, :) = c;
    end
end

%% Afisare rezultat.
display(debug);
imshow(imagine);
