function [ paleta ] = palette( imagine )
%PALETTE genereaza o paleta de culori principale a imaginii.
%
%   pal = palette(img) va intoarce paleta de culori principale ale img.
%
%   INTRARE: imagine = imaginea sursa RGB
%   IESIRE:   paleta = lista de culori RGB
%

I=imagine;
% numarul de culori populare
N=100;
step=15;

% dimensiunea unui cubulet RGB
dim = ceil(255/step);
% matrice pentru calculul frecventei culorilor
LMAP = zeros(dim,dim,dim);

rows=size(I,1);
columns=size(I,2);

for i=1:rows
    for j=1:columns        
        r=ceil(I(i,j,1)/step); r=max(r,1);
        g=ceil(I(i,j,2)/step); g=max(g,1);
        b=ceil(I(i,j,3)/step); b=max(b,1);
        %incrementarea frecventei
        LMAP(r,g,b)=LMAP(r,g,b)+1;
    end
end

%liniarizarea matricii
LV=LMAP(:);
% sortarea vectorului
[LVS,INDEX]=sort(LV,'descend');

IND = INDEX(1:N);
s = [dim,dim,dim];
% indecsii corespunzator culorilor populare
[IR,IG,IB] = ind2sub(s,IND);

% mapa de culori
paleta=zeros(N,3);
for k=1:N
    %setarea paletei de culori dupa valoarea culorii in RGB
    paleta(k,:)=[((IR(k)-1)*step) ((IG(k)-1)*step) ((IB(k)-1)*step)];
end


end

