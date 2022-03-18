%% Experimentelle Bestimmung von N
% importieren der Konstanten
c = konstanten();
N =2.^(1:16);
% S0 = 10^2;
% S0 = 10^3;
S0 = 10^4;
s = @(z) (S0 * exp(-c.alpha*z));
maxerr = NaN(size(N));
for i=1:length(N)-1
    
    % N�herungsweise L�sung
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

loglog(N, maxerr,'*-','Linewidth', 2, 'Markersize', 5, 'color', 'g');
legendString = sprintf('N =  %.0f',Nresult);
legend(legendString);
grid on
xlabel('Anzahl der Teilintervalle');
ylabel('max. abs. Fehler [um]');

%% Berechnung der F�lle f�r S_0 = 10^2, 10^3 und 10^4

N_optimal = 512;
S_0_1 = 10^2;
s1 = @(z) (S_0_1 * exp(-c.alpha*z));
S_0_2 = 10^3;
s2 = @(z) (S_0_2 * exp(-c.alpha*z));
S_0_3 = 10^4;
s3 = @(z) (S_0_3 * exp(-c.alpha*z));

[z_lsg_1,u_lsg_1] = stationaer_lin(s1, N_optimal);
[z_lsg_2,u_lsg_2] = stationaer_lin(s2, N_optimal);
[z_lsg_3,u_lsg_3] = stationaer_lin(s3, N_optimal);

plot(z_lsg_1,u_lsg_1,'-o',z_lsg_2,u_lsg_2,'-o',z_lsg_3,u_lsg_3,'-o','Linewidth',1,'Markersize', 3)
legend('S_0 = 10^2', 'S_0 = 10^2', 'S_0 = 10^2')
grid on
xlabel('z [um]');
ylabel('u [1]');
title('L�sungen von s(z) bei verschiedenen S_0');