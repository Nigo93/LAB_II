%dati sperimentali ottenuti prima dei vari cambi
pressione = [900;850;800;750;700;650;600;550;500;450;400;350;300];
temperatura = [41;49;56;61;66;69;72;75;78;81;83;85;87];

%temperatura espressa in Kelvin
T_kelvin = temperatura+273.15;

%temperatura 1/T da inserire nel grafico
T = 1./T_kelvin;

%calcolo degli errori su temperatura;
%errore di risoluzione
dT_ris = 1/sqrt(12);
dT = dT_ris.*(T.^2);

%pressione in pascal
pressione_pascal = pressione.*100;

%pressione atmosferica in pascal
pressione_atmosferica = 727*133.32;

%pressione all'interno del barattolo
P = pressione_atmosferica-pressione_pascal;


%calcolo dell'errore sulla pressione
%errore di risoluzione manometro differenziale
dP1_ris = 5000/(sqrt(12));
%errore di risoluzione manometro differenziale a tubi di vetro
dP2_ris = 133.32/(sqrt(12));
%errore totale sulla pressione nel recipiente
dP = sqrt(dP1_ris^2+dP2_ris^2);

%errore sulla pressione in scala logaritmica
dP_log = (dP./P);

%grafico
h = errorbarxy(T,log(P),dT.*ones(size(T)),dP_log);
hh = get(h, 'children');
% La linea coi valori misurati
hh1 = h(1);  
% Non traccio le linee di congiunzione
set(hh1, 'linestyle', 'none')
% Visualizzo invece i punti singoli
set(hh1, 'marker', '.', 'markersize', 4.6);
% E li coloro di nero
set(hh1, 'color', 'b')

% Le barre d'errore
hh2 = hh(2);
% Le faccio magenta
%set(hh2, 'color', 'g')

setbarsize(h,T,0.0,log(P),0.0);


%% Aggiusto la forma dei 'cappelli'
setbarsize(h, T, 0.0, log(P), 0.0)

grid on

hold on


%test del chi quadro

chi = sum(((log(P)-b*T-a)./dP_log).^2);

