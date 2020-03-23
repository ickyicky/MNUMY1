function [A, b] = generator_c(n)
b = zeros(n, 1);
A = zeros(n, n);

for i = 1 : n
    for j = 1 : n
        if ( i == j )
            A(i, j) = 0.1 * n + 0.3 * i;
        else
            A(i, j) = 1 / ( 6 * ( i + j + 1) );
        end
        b(i) = 5 / ( 3 * i );
    end
end