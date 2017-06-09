%% Citire imagine Watermark.
% Imaginea watermark contine doar culori binare (0 si 1) si este
% de o marime [w, h].
watermark = imread('watermark1.bmp');
[w, h] = size(watermark);

%% Citire imagine tinta.
% Imaginea tinta este o imagine colorata RGB de dimensiune [W, H].
image = imread('Lena.tiff');
[W, H] = size(image);

%% Criptare imagine Watermark.
watermark = enc(watermark);

%% Generare harta Watermark.
harta = genmap(w, h, W, H);

%% Gasire paleta principala de culori.
paleta = palette(image);
paleta = sortpalette(paleta);

%% Inserarea watermark-ului in imagine.
% Imaginea procesata.
imagine2 = zeros(W, H);

% Cuantizarea imaginii.
for i = 1 : W
    for j = 1 : H
        % Gasire index culoare cea mai apropiata din paleta.
        I = minpalette(image(i, j), paleta);
        % Gasire culoare paleta.
        c = paleta(I);
        % Formare imagine cuantizata.
        imagine2(i, j) = c;
    end
end

% Imbinarea watermark-ului.
for i = 1 : w
    for j = 1 : h
        % Gasirea coordonatelor in imagine.
        [a, b] = harta(i, j);
        % Calculare pixel combinat.
        c = embed(image(a, b), watermark(i, j));
        % Formare imagine finala.
        imagine2(a, b) = c;
    end
end

%% Afisare rezultat.

