function [ harta ] = genmap( A, B, X, Y )
%GENMAP genereaza o harta de pozitii dintr-o matrice mai mica in una mai mare.
%
%   harta = genmap(A, B, X, Y) va genera un mapping din [A, B] in [X, Y].
%   
%   INTRARE:    A = numar randuri matrice mica
%               B = numar coloane matrice mica
%               X = numar randuri matrice mare
%               Y = numar coloane matrice mare
%   IESIRE: harta = matrice AxB cu valori perechi (a,b) de maxime (X,Y).
%   
    random_vector=randperm(X*Y,A*B);
    harta=zeros(A,B,2);
    for i = 1 : A
        for j = 1 : B
            N=random_vector((i-1)*A+j);
            harta(i,j,:)=[floor((N/X)+1) mod(N,X)+1];
        end
    end
end

