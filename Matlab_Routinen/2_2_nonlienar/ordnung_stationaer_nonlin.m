N = 2.^(2:10);
maxerr = zeros(size(N));
for i=1:length(N)
    maxerr(i) = test_stationaer_nonlin(N(i));
end

figure
loglog(N,maxerr)
grid('on')