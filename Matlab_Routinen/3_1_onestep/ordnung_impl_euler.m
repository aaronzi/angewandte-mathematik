N = 2.^(2:10);
err = zeros(size(N));

for i=1:length(N)
    err(i) = test_impl_euler(N(i));
end

figure
loglog(N, err, 'Linewidth', 3);
grid on
xlabel('Anzahl der Teilintervalle');
ylabel('max. abs. Fehler [m]');