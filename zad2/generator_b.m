function [A, b] = generator_b(n)
b = zeros(n, 1);
A = zeros(n, n);

for i = 1 : n
    for j = 1 : n
        if ( i == j )
            A(i, j) = 3 * n^2 - i;
        else
            A(i, j) = i + j + 1;
        end
        b(i) = 2.5 + 0.6 * i;
    end
end