%creo retta
Xr = [-10;0.001;15];
Yr = 5*ones(size(Xr));

% intensit√† rotazione verso dx
I1 = [17.3; 16; 15; 13.8; 11.9; 10.9; 9.5; 7.9; 6.6; 6; 5; 3.8; 2.9; 2; 1; 0.51; 0.24];

% angoli rotazione verso dx
phi1 = [1.25; 3.25; 4; 5; 5.5; 6; 6.75; 7.5; 8; 8.75; 9; 9.5; 10; 10.5; 11; 11.75; 12.75];

% intensit√† rotazione verso sx
I2 = [16.9; 14.8; 13.6; 11.9; 10.9; 10; 9; 8; 7.1; 6; 5.1; 4.1; 2.9; 1.9; 1; 0.5; 0.25];
 % angoli rotazione verso sx
phi2 = [1.5; 0; -0.25; -1; -1.25; -1.5; -2; -2.5; -2.75; -3.25; -3.75; -4.25; -4.75; -5.5; -6.25; -7.25; -8];

%angoli centrati sullo 0
Phi1 = phi1-1.25;
Phi2 = phi2-1.50;
% intensit√† e rotazione totali
I = [I1; I2];
phi = [phi1; phi2];
%intensit‡ normalizzata
In1 = (I1./17.3).*100;
In2 = (I2./16.9).*100;

%calcolo dell'errore sull'intensit‡;
d_I = 0.05/sqrt(12);
d_In1 = (1./17.3).*100.*d_I;
d_In2 = (1./16.9).*100.*d_I;



%errore sull'angolo;
%errore su angolo in gradi
d_phi = 0.05/sqrt(12);


%grafico
In = [In1;In2];

d_In = [d_In1; d_In2];

h1 = errorbarxy(Phi1, In1, d_phi*ones(size(In1)), 25*d_I*ones(size(In1)));
hold on;
h2 = errorbarxy(Phi2, In2, d_phi*ones(size(In2)), 25*d_I*ones(size(In2)));
hold on;
plot(Xr, Yr);
setbarsize(h1, Phi1, 0, In1, 0);

setbarsize(h2, Phi2, 0, In2, 0);

%calcolo di teta massimo
Y1 = [5.7803; 2.9480];
X1 = [9.75; 10.5];

Y2 = [5.9172; 2.9586];
X2 = [7.75; 8.75];

[A1,B1,d_a1,d_b1] = reglin( X1,Y1,[d_phi; d_phi] );
[A2,B2,d_a2,d_b2] = reglin( X2,Y2,[d_phi; d_phi] );

teta1 = (5-A1)/B1;
teta2 = (5-A2)/B2;

d_teta1 = sqrt((d_a1/B1)^2+(((5-A1)*d_b1)/B1^2)^2);
d_teta2 = sqrt((d_a2/B2)^2+(((5-A2)*d_b2)/B2^2)^2);

%media pesata
teta = [teta1; teta2];
d_teta = [d_teta1; d_teta2];
w = (1./d_teta).^2;
teta_max = sum(teta.*w)/sum(w);

d_teta_max = sqrt(1/sum(w));
%calcolo di NA

NA = sin(teta_max);
d_NA = cos(teta_max)*d_teta_max;

