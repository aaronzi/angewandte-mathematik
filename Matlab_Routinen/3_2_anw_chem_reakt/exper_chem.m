tspan = [0,1];
ya = [1; 0; 0];

tol = 1e-8;
nmax = 10;

n =2.^(1:16);

% Explizites Euler-Verfahren
for i=1:length(n)-1
    [t_euler_sys_1,y_euler_sys_1] = euler_systeme(@f_chem,tspan,ya,n(i));
    [t_euler_sys_2,y_euler_sys_2] = euler_systeme(@f_chem,tspan,ya,n(i+1));
    y_euler_sys_2_s = y_euler_sys_2(1:2:end,:);
    f_abs = abs(y_euler_sys_1-y_euler_sys_2_s);
    [maxerr] = max(f_abs);
    if maxerr < 10^(-6)
        disp("Explizites Euler-Verfahren")
        n(i)
        f_abs(n(i),:)
        break;
    end
end
% Mittelpunktsregel
for i=1:length(n)-1
    [t_mittelp_1,y_mittelp_1] = mittelpunktsregel_systeme(@f_chem,tspan,ya,n(i));
    [t_mittelp_2,y_mittelp_2] = mittelpunktsregel_systeme(@f_chem,tspan,ya,n(i+1));
    y_mittelp_2_s = y_mittelp_2(1:2:end,:);
    f_abs = abs(y_mittelp_1-y_mittelp_2_s);
    [maxerr] = max(f_abs);
    if maxerr < 10^(-6)
        disp("Mittelspunktsregel")
        n(i)
        f_abs(n(i),:)
        break;
    end
end
% Implizites Euler-Verfahren
for i=1:length(n)-1
    [t_euler_impl_1,y_euler_impl_1]=impl_euler(@f_chem,tspan,ya,n(i),@f_chem_jac,tol,nmax);
    [t_euler_impl_2,y_euler_impl_2]=impl_euler(@f_chem,tspan,ya,n(i+1),@f_chem_jac,tol,nmax);
    y_euler_impl_2_s = y_euler_impl_2(1:2:end,:);
    f_abs = abs(y_euler_impl_1-y_euler_impl_2_s);
    [maxerr] = max(f_abs);
    if maxerr < 10^(-6)
        disp("Implizites Euler-Verfahren")
        n(i)
        f_abs(n(i),:)
        break;
    end
end
% Implizite Trapezregel
for i=1:length(n)-1
    [t_trap_impl_1,y_trap_impl_1]=impl_trapez(@f_chem,tspan,ya,n(i),@f_chem_jac,tol,nmax);
    [t_trap_impl_2,y_trap_impl_2]=impl_trapez(@f_chem,tspan,ya,n(i+1),@f_chem_jac,tol,nmax);
    y_trap_impl_2_s = y_trap_impl_2(1:2:end,:);
    f_abs = abs(y_trap_impl_1-y_trap_impl_2_s);
    [maxerr] = max(f_abs);
    if maxerr < 10^(-6)
        disp("Implizite Trapezregel")
        n(i)
        f_abs(n(i),:)
        break;
    end
end

% [t_trap_impl,y_trap_impl]=impl_trapez(@f_chem,tspan,ya,n,@f_chem_jac,tol,nmax);

