function [ paleta ] = sortpalette( paleta )
%SORTPALETTE va sorta o paleta de culori.
%
%   paleta = sortpalette(paleta) va sorta paleta de culori.
%
%   INTRARE: paleta = paleta de culori nesortata
%   IESIRE:  paleta = paleta de culori sortata
%

    [unused, pcaResult, unused] = pca(paleta, 'NumComponents', 1);
    [unused, pcaSort] = sort(pcaResult);
    paleta = paleta(pcaSort, :);

end

