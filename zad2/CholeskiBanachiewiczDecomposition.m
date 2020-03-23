function [L] = CholeskiBanachiewiczDecomposition(A)
sl = size(A);

if ( sl(1) ~= sl(2) )
    return;
end

L = zeros(sl);

for i = 1 : sl(1)
    L(i, i) = sqrt( A(i, i) - sum( L(i, 1 : i-1).^2 ) );
    for j = i + 1: sl(1)
        % suma L(j, k) * L(i, k) dla k = 1 : i - 1
        % może być zapisana jako:
        %   sum( L(j, 1 : i - 1) .* L(i, 1 : i - 1) )
        L(j, i) = ( A(j, i) - sum( L(j, 1 : i - 1) .* L(i, 1 : i - 1) ) ) / L(i, i);
    end
end