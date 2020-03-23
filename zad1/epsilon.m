function [epsilon] = epsilon()
% funkcja EPISLON wyznacza epsilon -
%  dokładność maszynową komputera
epsilon = 1;
while (1 + (epsilon / 2) > 1)
    epsilon = epsilon / 2;
end
end