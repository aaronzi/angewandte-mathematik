function maxerr=test_impl_trapez(N)
    f = @(t,y) -y;
    df = @(t,y) -1;
    yexakt = @(t) exp(-t);
    tspan = [0,1];
    ya = 1;
    % n = 100;
    tol = 1e-8;
    nmax = 10;
    
    [t,y]=impl_trapez(f,tspan,ya,N,df,tol,nmax);
    
    ye = yexakt(t);
    plot(t,y, '-o', t,ye, 'Linewidth', 3)
    
    err = abs(y - yexakt(t));
    maxerr = max(err);
end