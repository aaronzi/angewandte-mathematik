function [t,y] = error_func(nTime,nLocation)
    c = konstanten();
    s0 = 1e2;
    tspan = [-0.05,0.2];
    tol = 1e-6;
    nmax = 12;

    s = @(t,z) s0*exp((-t^2)/(2*0.01^2))*exp(-c.alpha*z);
    z = (0:nLocation)'/ nLocation * c.d;
    f = @(t,u) fd_nonlin(u,nLocation) + s(t,z);
    df = @(t,u) fd_nonlin_jac(u,nLocation);
    ya = zeros(nLocation+1,1);
    [t,y] = impl_trapez(f,tspan,ya,nTime,df,tol,nmax);

end