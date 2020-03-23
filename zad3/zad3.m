clear all;

t_max = 180;
max_n = 20480;
e = 10^-10;

n = 10;
dt = 0;
i = 1;
n_b(i) = 0;
t_b(i) = 0;
errors_b(i) = 0;
norms_b(i) = 0;
iters_b(i) = 0;

while dt < t_max && n <= max_n
    t0 = tic;
    
    [A, b] = generator_b(n);
    [x, norm, iters] = GaussSeidel(A, b, e);
    
    r = A * x - b;
    n_b(i) = n;
    errors_b(i) = sum(abs(r));
    norms_b(i) = norm();
    iters_b(i) = iters;
    
    dt = toc(t0);
    t_b(i) = dt;
    fprintf('generator_b, n = %d, num of iterations: %d, took: %f s\n', n, iters, dt);
    i = i + 1;
    n = n * 2;
end

figure(1);
plot(n_b, iters_b, 'o')
title("Metoda Gauusa-Seidel'a, punkt b - liczba iteracji(n)");
xlabel("Liczba równań"); ylabel("Liczba iteracji");
saveas(1, "./plots/zad_3b_iters.fig");
saveas(1, "./plots/zad_3b_iters.png");

figure(2);
plot(n_b, errors_b, 'o')
title("Metoda Gauusa-Seidel'a, punkt b - norma residuum(n)");
xlabel("Liczba równań n"); ylabel("Norma residuum");
saveas(2, "./plots/zad_3b_errors.fig");
saveas(2, "./plots/zad_3b_errors.png");

figure(3)
plot(n_b, t_b, 'o')
title("Metoda Gauusa-Seidel'a, punkt b - t(n)");
xlabel("Liczba równań n"); ylabel("Czas t(s)");
saveas(3, "./plots/zad_3b_t.fig");
saveas(3, "./plots/zad_3b_t.png");