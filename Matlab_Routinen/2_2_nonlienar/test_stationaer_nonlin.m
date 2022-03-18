function maxerr = test_stationaer_nonlin(N)
    c = konstanten();
    lambda = 1;
    a = 1;
    us = @(z) a*exp(lambda*z); % Vorgabe einer Lösung
    % dus = @(z) lambda*a*exp(lambda*z); % 1. Ableitung der Lösung 
    dus2 = @(z) lambda^2*a*exp(lambda*z); % 2. Ableitung der Lösung

    s = @(z) -(c.D * dus2(z) - c.k * us(z) - c.k2 *(us(z).^2)); % DGL

    % N = 100;
    tol = 10^(-12);
    nmax = 10;

    [z,u] = stationaer_nonlin(s,N,tol,nmax);

    % ze = 0:0.001:c.d;
    ue = us(z);

    % absoluter Fehler
    err = abs(u-ue);
    
    subplot(2,1,1);
    plot(z,u,'o-',z,ue, 'Linewidth', 3, 'Markersize', 8)
    legend('FD Lösung', 'Analytisch')
    xlabel('z [um]');
    ylabel('u [1]');
    title('Ladungsträgerdichte')
    
    subplot(2,1,2);
    plot(z,err,'-')
    xlabel('z [um]');
    ylabel('abs. Fehler [1]');
    title('Fehler');
    
    maxerr = max(err);
end