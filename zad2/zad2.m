clear all;

t_max = 180;

n = 10;
dt = 0;
i = 1;
n_a(i) = 0;
t_a(i) = 0;
errors_a(i) = 0;

while dt < t_max
    t0 = tic;
    
    [A, b] = generator_a(n);
    x = solver(A, b);
    
    r = A * x - b;
    n_a(i) = n;
    errors_a(i) = sum(abs(r));
    
    dt = toc(t0);
    t_a(i) = dt;
    fprintf('generator_a, n = %d, took: %f s\n', n, dt);
    i = i + 1;
    n = n * 2;
end

n = 10;
dt = 0;
i = 1;
errors_b(i) = 0;
n_b(i) = 0;
t_b(i) = 0;

while dt < t_max
    t0 = tic;
    
    [A, b] = generator_b(n);
    x = solver(A, b);
    
    r = A * x - b;
    errors_b(i) = sum(abs(r));
    n_b(i) = n;
    
    dt = toc(t0);
    t_b(i) = dt;
    fprintf('generator_b, n = %d, took: %f s\n', n, dt);
    i = i + 1;
    n = n * 2;
end

n = 10;
dt = 0;
i = 1;
errors_c(i) = 0;
n_c(i) = 0;
t_c(i) = 0;

while dt < t_max
    t0 = tic;
    
    [A, b] = generator_c(n);
    x = solver(A, b);
    
    r = A * x - b;
    errors_c(i) = sum(abs(r));
    n_c(i) = n;
    
    dt = toc(t0);
    t_c(i) = dt;
    fprintf('generator_c, n = %d, took: %f s\n', n, dt);
    i = i + 1;
    n = n * 2;
end

%Plots
figure(1);
plot(n_a, errors_a, 'o')
title("Faktoryzacja Choleskiego-Banasiewicza, punkt a - norma residuum(n)");
xlabel("Liczba równań"); ylabel("Norma residuum");
saveas(1, "./plots/zad_2a.fig");
saveas(1, "./plots/zad_2a.png");

figure(2)
plot(n_a, t_a, 'o')
title("Faktoryzacja Choleskiego-Banasiewicza, punkt a - t(n)");
xlabel("Liczba równań n"); ylabel("Czas t(s)");
saveas(1, "./plots/zad_2a_t.fig");
saveas(1, "./plots/zad_2a_t.png");

figure(3);
plot(n_b, errors_b, 'o')
title("Faktoryzacja Choleskiego-Banasiewicza, punkt b - norma residuum(n)");
xlabel("Liczba równań n"); ylabel("Norma residuum");
saveas(3, "./plots/zad_2b.fig");
saveas(3, "./plots/zad_2b.png");

figure(4)
plot(n_b, t_b, 'o')
title("Faktoryzacja Choleskiego-Banasiewicza, punkt b - t(n)");
xlabel("Liczba równań n"); ylabel("Czas t(s)");
saveas(4, "./plots/zad_2b_t.fig");
saveas(4, "./plots/zad_2b_t.png");

figure(5);
plot(n_c, errors_c, 'o')
title("Faktoryzacja Choleskiego-Banasiewicza, punkt c - norma residuum(n)");
xlabel("Liczba równań n"); ylabel("Norma residuum");
saveas(5, "./plots/zad_2c.fig");
saveas(5, "./plots/zad_2c.png");

figure(6)
plot(n_c, t_c, 'o')
title("Faktoryzacja Choleskiego-Banasiewicza, punkt c - t(n)");
xlabel("Liczba równań n"); ylabel("Czas t(s)");
saveas(6, "./plots/zad_2c_t.fig");
saveas(6, "./plots/zad_2c_t.png");