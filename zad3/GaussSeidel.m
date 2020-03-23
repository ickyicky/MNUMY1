function [x, r] = GaussSeidel(A, b, e)

la = size(A);
x = zeros(la(1), 1);
n = la(1);

L = zeros(n);
D = zeros(n);
U = zeros(n);

for i = 2:1:n
    for j = 1:1:i-1
        L(i,j) = A(i,j);
    end
end

for i = 1:1:n
    D(i,i) = A(i,i);
end

for i = 1:1:n
    for j = i+1:1:n
        U(i,j) = A(i,j);
    end
end


iter = 1;
% normę euklidesową możemy zapisać jako:
r(iter) = sqrt(sum((A * x - b).^2));

while r(iter) > e
    %for i = 1 : n
    %    x(i) = ( b(i) - sum( A(i, 1 : i -1) .* x(1 : i - 1)' ) - sum( A(i, i + 1 : n) .* x(i + 1 : n)' ) ) / A(i, i);
    %end
    x = (D + L)^-1 * (-(U*x) + b);
    i = i + 1;
    r(iter) = sqrt(sum((A * x - b).^2));
end

