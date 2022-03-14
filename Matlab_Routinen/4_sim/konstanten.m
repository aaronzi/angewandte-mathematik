function c=konstanten()
    %lambda = 1;
    % Konstanten
    c.d = 0.3; % Dicke in um
    c.D = 0.003 * ((1e4)^2)/(1e6); % Diffusionskonstante in um2/us
    c.k1 = 10e6 * 1/(1e6); % Rekombinationskonstante 1 in 1/us
    c.k2 = 10e-8 * ((1e4)^3)/(1e6); % Rekombinationskonstante 2 in um3/us
    c.ND = 10e15 * 1/((1e4)^3); % Dotierungsdichte in 1/um3
    c.SL = 10 * (1e4)/(1e6); % Rekombinationsrate untere Grenze in um/us
    % c.SL = c.D*lambda; % Rekombinationsrate untere Grenze in um/us
    c.SR = 10e5 * (1e4)/(1e6); % Rekombinationsrate obere Grenze in um/us
    % c.SR = -c.D*lambda; % Rekombinationsrate obere Grenze in um/us
    c.alpha = 1e5 * 1/(1e4); % Absorptionskonstante in 1/um
    % Abgeleitete Konstanten
    c.k = c.k1 + c.k2 * c.ND;
end