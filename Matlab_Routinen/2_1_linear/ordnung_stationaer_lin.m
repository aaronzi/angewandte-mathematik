% Vorgabe der Teilintervalle
N = 2.^(2:10);

% Eurzeugen eines Fehlervektors der Länge N
err = zeros(size(N));

% Aufruf von test_stationaer_lin mit Iteration über N
for i=1:length(N)
    err(i) = test_stationaer_lin(N(i));
end

% Plot des maximalen Fehlers bei steigendem N
figure
loglog(N, err, 'Linewidth', 3);
grid on
xlabel('Anzahl der Teilintervalle');
ylabel('max. abs. Fehler [um]');