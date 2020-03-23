function [n] = EuclideanNorm(x)
% EuclideanNorm oblicza normę euklidesową
%  n dla zadanego macierza x
n = sqrt(sum((x).^2));
