%% Prima esperimento

%% a -> numero di frange in funzione della veriazione di pressione

% Differenza di pressione [Torr]
DelP = [100
    200
    300
    400
    500
    600
    700
    800
    900];

% Numero di frange "contate" -> 3 ripetizioni e media
F11 = [2.5
    5
    7.5
    10
    12
    14.5
    17
    19.5
    22];

F12 = [2.5
    5
    7.5
    10
    12
    15
    17
    19.5
    22];

F13 = [2.5
    5
    7.5
    10
    12.5
    15
    17.5
    19.5
    22];

F1m = (F11+F12+F13)./3;

% Incertezza su delP
% errore di risoluzione
dP = 10/sqrt(12); % non abbiamo scritto la risoluzione del manometro, ho messo a caso
% vettore errore
dPvett = dP*ones(size(DelP));

% Icertezza su F1
% errore di risoluzione
dF1_ris = 0.5/sqrt(12);
dF1 = dF1_ris/sqrt(27);
%vettore errore
dF1vett = dF1*ones(size(F1m));

h = errorbarxy(F1m, DelP, dF1vett, dPvett);
setbarsize(h, F1m, 0, DelP, 0);
[A, B, d_a, d_b] = reglin(F1m, DelP, dP);

n_atm = 1+(A)/(0.06430/543.5);


%% b -> numero di frange in funzione della variazione dell'angolo [Gradi]

Theta = [1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13
    14
    15
    16
    17];

F21 = [1
    4
    8
    16
    26
    38
    52.5
    67.5
    89.5
    110.5
    140.5
    165.5
    199
    230
    264.5
    285
    323.5];

F22 = [1
    4
    8
    16
    26
    38
    52.5
    67.5
    89.5
    110.5
    140.5
    165.5
    198
    234
    268.5
    285
    323.5];

F23 = [1
    4
    8.5
    16
    27
    43
    56.5
    72
    94
    114.5
    135
    162
    187.5
    216.5
    252
    286
    324.5];

F24 = [1
    4
    8.5
    16
    26
    43
    55.5
    71
    88
    106.5
    128
    160
    187.5
    215.5
    249
    284
    322.5];

F2m = (F21+F22+F23+F24)./4;

Del_n = F1m./(2*5.65/543.5);

% Incertezza su theta
% errore si risoluzione
dTheta = 0.06/sqrt(12);

% Incertezza su F2
dF2 = 0.5/sqrt(12);


