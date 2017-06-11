function [ i ] = minpalette( culoare, paleta )
%MINPALETTE gaseste culoarea cea mai apropiata dintr-o paleta.
%
%   i = minpalette(c, p) va gasi un c cel mai apropiat din p
%
%   INTRARE: culoare = culoarea cautata
%             paleta = paleta de culori utilizabile
%   IESIRE:        i = culoarea din paleta cea mai apropiata (index)
%

% Calculam distantele patratice euclidiene (SED-urile).
N = size(paleta, 1);
seds = zeros(N, 1);
for i = 1 : N
    seds(i) = sed(culoare, paleta(i,:));
end

% Intoarcem index-ul corespondent distantei minime.
[~, i] = min(seds);

end

