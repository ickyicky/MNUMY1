function [L, D, U] = decomposeLDU(A)
% decomposeLDU - funkcja dokonuje dekompozycji macierzy A
%    na macierze L, D oraz U, gdzie:
%     L - macierz dolna trójkątna (bez przekątnej)
%     D - macierz diagonalna
%     U - macierz gówna trójkątna (bez przekątnej)

n = size(A);
L = zeros(n);
D = zeros(n);
U = zeros(n);

for i = 2 : n(1)
    for j = 1 : i -1
        L(i, j) = A(i, j);
    end
end

for i = 1 : n(1)
    D(i, i) = A(i, i);
end

for i = 1 : n(1) - 1
    for j = i + 1 : n(1)
        U(i, j) = A(i, j);
    end
end