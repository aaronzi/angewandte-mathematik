% function maxerr=test_onestep(N)
%     f = @(t,y) -y;
%     df = @(t,y) -1;
%     yexakt = @(t) exp(-t);

    tspan = [0,1];
    ya = [1; 0; 0];
    n = 100;
    tol = 1e-8;
    nmax = 10;
    
    [t,y]=impl_euler(@f_chem,tspan,ya,n,@f_chem_jac,tol,nmax);
    
    % ye = yexakt(t);
    plot(t,y, '-o')
    
%     err = abs(y - yexakt(t));
%     maxerr = max(err);
% end