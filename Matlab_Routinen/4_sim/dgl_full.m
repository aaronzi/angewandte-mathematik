% Anfangsparameter
nTime = 512;
nLocation = 512;
[t,y] = error_func(nTime,nLocation);

% Vergleichswerte
nTime = 1024;
nLocation = 512;
[t1,y1] = error_func(nTime,nLocation);
y1s = y1(1:2:end, 1:1:end);
disp(norm(y(:)-y1s(:),inf)/norm(y1s(:),inf))

% Vergleichswerte
nTime = 512;
nLocation = 1024;
[t2,y2] = error_func(nTime,nLocation);
y2s = y2(1:1:end, 1:2:end);
disp(norm(y(:)-y2s(:),inf)/norm(y2s(:),inf))

% Plot
mesh(y)