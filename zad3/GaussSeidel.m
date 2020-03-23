function [x, norms, iter] = GaussSeidel(A, b, e)
% GaussSeidel - iteracyjnie przybliża rozwiązanie układu
%  A * x = b. Iteracja algorytmu trwa do momentu, aż
%  norma Euklidesowa różnic kolejnych rozwiązań  będzie mniejsza lub równa
%  zadanemu e. Dekompozycja na macierze L, D, U oraz sama
%  metoda obliczania normy Euklidesowej zostały zaimplementowane
%  jako osobne funkcje.

la = size(A);
n = la(1);
x = zeros(n, 1);
xi = zeros(size(x));

[L, D, U] = decomposeLDU(A);

iter = 1;
norms(iter) = 2 * e;

while norms(iter) > e
    w = U * x - b;
    for k = 1 : n
        xi(k) = ( sum( -L(k, 1 : k -1) .* x(1 : k -1)' ) - w(k) ) / D(k, k);
    end
    iter = iter + 1;
    norms(iter) = EuclideanNorm(xi - x);
    x = xi;
end