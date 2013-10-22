%grafico della pressione in funzione del tempo
%i valori di h sono in mm
h=[0;110; 143; 162; 198; 221; 234; 250; 262; 275; 285; 298; 311; 322; 329; 336; 344; 349; 353; 355; 358; 359; 360; 360; 360];
t=[0;1;2;3;4;5;6;7;8;9;10;12;14;16;18;20;24;28;32;36;44;52;60;70;80];
%calcolo della pressione residua in torricelli
P_torr=730-2.*h;

%calcolo della pression e da torricelli ad atmosfere
untorr=1/760; %atmosfere
P=P_torr.*untorr;


%calcolo degli errori
%errore su t
dt=0.3; 
%calcolo dell'errore sull pressione
dP_torr=0.5; 
dP=dP_torr.*untorr;


%grafico
%% Plot con barre d'errore sulle ordinate: errorbar
fig = figure();
h = errorbar(t, P, dP*ones(size(P)));
hh = get(h, 'children');
% La linea coi valori misurati
hh1 = hh(1);  

% Visualizzo invece i punti singoli
set(hh1, 'marker', '.', 'markersize', 16);
% E li coloro di nero
set(hh1, 'color', 'k')

% Le barre d'errore
hh2 = hh(2);

%aggiusto cappelli
%setbarwidth(h, t, 0.5)


%% Plot con barre d'errore sulle ascisse e sulle ordinate: errorbarxy
fig = figure();
h = errorbarxy(t, P, dP*ones(size(P)), dt*ones(size(t)));
% La linea coi valori misurati
hh1 = h(1);  
% Non traccio le linee di congiunzione
set(hh1, 'linestyle', 'none')
% Visualizzo invece i punti singoli
set(hh1, 'marker', '.', 'markersize', 16);
% E li coloro di nero
set(hh1, 'color', 'k')

% Le barre d'errore
hh2 = hh(2);
% Le faccio magenta
set(hh2, 'color', 'm')

%% Aggiusto la forma dei 'cappelli'
setbarsize(h, P, 0.0, t, 0.0)

grid on
hold on
