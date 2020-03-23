function [x] = solver(A, b)
% L * z = b
% L' * x = z
L = CholeskiBanachiewiczDecomposition(A);
sa = size(A);
z = zeros(sa(1), 1);

for k = 1 : sa(1)
    z(k) = ( b(k) - sum(L(k, 1 : k - 1) .* z(1 : k - 1)' ) ) / L(k, k);
end

x = zeros(sa(1), 1);
Lt = L';

for k = sa(1) : -1 : 1
    x(k) = ( z(k) - sum(Lt(k, k + 1 : sa(1)) .* x(k + 1 : sa(1))' ) ) / Lt(k, k);
end