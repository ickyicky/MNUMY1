function [x, norms, iter] = GaussSeidel(A, b, e)
% GaussSeidel - iteracyjnie przybliża rozwiązanie układu
%  A * x = b. Iteracja algorytmu trwa do momentu, aż
%  norma Euklidesowa residuum będzie mniejsza lub równa
%  zadanemu e. Dekompozycja na macierze L, D, U oraz sama
%  metoda obliczania normy Euklidesowej zostały zaimplementowane
%  jako osobne funkcje.

la = size(A);
n = la(1);
x = zeros(la(1), 1);

[L, D, U] = decomposeLDU(A);

iter = 1;
r = A * x - b;
norms(iter) = EuclideanNorm(r);

while norms(iter) > e
    w = U * x - b;
    for k = 1 : n
        x(k) = ( sum( -L(k, 1 : k -1) .* x(1 : k -1)' ) - w(k) ) / D(k, k);
    end
    iter = iter + 1;
    r = A * x - b;
    norms(iter) = EuclideanNorm(r);
end

