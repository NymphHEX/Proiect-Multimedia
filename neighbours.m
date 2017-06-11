function [ m ] = neighbours( M, p, s )
%NEIGHBOURS extrage vecinii unui element dintr-o matrice.
%
%   m = neighbours(M, p, s) extrage s vecini ai lui p.
%
%   INTRARE: M = matricea completa
%            p = pozitia punctului original
%            s = cantitatea de vecini (presupus nr impar)
%   IESIRE:  m = matricea veciniilor
%

m = zeros(s);
s2 = floor(s/2);

% Adaugare bordura de protectie.
M = padarray(M, [s2 s2], 'replicate');
p = p + [s2 s2];

% Calcul vecini.
for i = -s2 : s2
    for j = -s2 : s2
        m(i+s2+1, j+s2+1) = M(p(1)+i, p(2)+j);
    end
end

end
