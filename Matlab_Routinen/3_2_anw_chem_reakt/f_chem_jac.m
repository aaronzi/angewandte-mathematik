function J = f_chem_jac(~,y)
    J = [-0.04 10^4*y(3) 10^4*y(2); 0.04 -10^4*y(3)-6*10^7*y(2) -10^4*y(2); 0 6*10^7*y(2) 0];
end