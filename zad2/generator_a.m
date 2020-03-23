function [A, b] = generator_a(n)
b = zeros(n, 1);
A = zeros(n, n);

for i = 1 : n
    for j = 1 : n
        if ( i == j )
            A(i, j) = 10;
        elseif (i == j - 1 || i == j + 1)
            A(i, j) = 2.5;
            b(i) = 4 - 0.5 * i;
        end
    end
end