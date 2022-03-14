% importieren der Konstanten
c = konstanten();
N =2.^(1:16);
% S0 = 10^2;
% S0 = 10^3;
S0 = 10^4;
s = @(z) (S0 * exp(-c.alpha*z));
maxerr = NaN(size(N));
for i=1:length(N)-1
    
    % Näherungsweise Lösung
    [z1,u1] = stationaer_lin(s, N(i));
    [z2,u2] = stationaer_lin(s, N(i+1));
    u2s = u2(1:2:end);
    maxerr(i) = norm((u1-u2s)./u2s,inf);
    if maxerr(i) < 10^(-3)
        Nresult = N(i);
        disp('ok')
        break
    end
end
subplot(2,1,1);
loglog(N, maxerr,'*-','Linewidth', 2, 'Markersize', 5, 'color', 'g');
legendString = sprintf('N =  %.0f',Nresult);
legend(legendString);
grid on
xlabel('Anzahl der Teilintervalle');
ylabel('max. abs. Fehler [um]');
title('Experiment: N-Bestimmung');

subplot(2,1,2);
plot(z2,u2,'o-','Linewidth', 1, 'Markersize', 3)
legend('FD Lösung')
grid on
xlabel('z [um]');
ylabel('u [1]');
title('Ladungsträgerdichte');