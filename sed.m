function [ dist ] = sed( a, b )
%SED calculeaza distanta patratica euclidiana.
%
%   d = sed(a,b) va intoarce distanta patratica euclidiana.
%
%   INTRARE:    a = primul vector de N elemente
%               b = al doilea vector de N elemente
%   IESIRE:  dist = distanta dintre elemente
%

N = size(a, 2);
dist = 0;
for i = 1 : N
   dist = dist + (a(i) - b(i))^2;
end

end

