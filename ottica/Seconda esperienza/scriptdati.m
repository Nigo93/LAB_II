% intensità rotazione verso dx
I1 = [17.3
    16
    15
    13.8
    12.9
    11.9
    10.9
    9.5
    7.9
    6.6
    6
    5
    3.8
    2.9
    2
    1
    .51
    .24];

% angoli rotazione verso dx
phi1 = [1.25
    3.25
    4
    5
    5.5
    6
    6.75
    7.5
    8
    8.75
    9
    9.5
    10
    10.5
    11
    11.75
    12.75
    13.50];

% intensità rotazione verso sx
I2 = [16.9
    14.8
    13.6
    11.9
    10.9
    10
    9
    8
    7.1
    6
    5.1
    4.1
    2.9
    1.9
    1
    .5
    .25];
 % angoli rotazione verso sx
phi2 = [1.5
    0
    -.25
    -1
    -1.25
    -1.5
    -2
    -2.5
    -2.75
    -3.25
    -3.75
    -4.25
    -4.75
    -5.5
    -6.25
    -7.25
    -8];

% intensità e rotazione totali
I = [I1; I2];
phi = [phi1; phi2];

% plot non normalizzato dei valori (giusto per controllare che abbiano un po' di senso)
plot (phi1, I1, 'Marker','.','LineStyle','none');
hold on
plot (phi2, I2, 'Marker','.','LineStyle','none');



