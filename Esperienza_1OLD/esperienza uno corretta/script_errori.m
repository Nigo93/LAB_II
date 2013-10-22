%dati costanti:
n=0.33;
M=[1.3; 9.2; 13.1; 15.2];
R=0.082; %(litri*atmosfere)/(K*mol)
V=2.775; %volume della bottiglia in litri;
unatm=(730/760); %pressione atmosferica in atm
T=295; %gradi kelvin, temperatura dell'ambiente
dT_ris=1; %errore risoluzione termometro
dV_ris= 0.009; %litri
%calcolo dell'errore dovuto alla misura sulla massa dei vari gas
dm_ris = sqrt(2*0.05^2);
%calcolo dell'errore sulla pressione dovuto alla risoluzione 
%conversione da torr a atmosfere
%risoluzione dello strumento:1mmHg
%da torr a atmosfere:
untorr=1/760; %atmosfere
%errore massimo di risoluzione dello strumento:
dP_ris=(untorr)/2; 

%errore sulla massa dovuto alla risoluzione dello strumento:
dM_ris = 0.05; %grammi

%errore di risoluzione del manometro
dP_manometro = 0.05*(unatm); %errore manometro differenziale

%calcolo dell'errore sul numero di moli partendo dalla legge dei gas

%errore dovuto al volume
dn_V=((3*(unatm))/(R*T))*dV_ris;

%errore dovuto alla pressione
dn_P=(V/(R*T))*dP_manometro;

%errore dovuto alla temperatura
dn_T=((3*unatm*V)/(R*T^2))*dT_ris;

%calcolo dell'errore totale sul numero di moli
dn=sqrt(dn_V^2+dn_P^2+dn_T^2);

%calcolo dell'errore sulla massa molare
%calcolo derivante dal numero di moli
dm_n=(M./(n^2))*dn;

%calcolo dell'errore dovuto alla massa
dm_m=(1/n)*dm_ris; %nota: la massa è espressa in grammi

%calcolo l'errore totale
dm=sqrt(dm_n.^2+dm_m.^2);