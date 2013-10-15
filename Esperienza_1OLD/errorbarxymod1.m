
%% Esempio di analisi dati 
% per l'esperimento di deformazione elastica di una molla: 
% misure 'statiche'
% 
% Vettore delle forze applicate
g = 9.806;  % m s^-2
m = columnA; % kg
Dm = 1e-4; % kg
P  = m * g;  % N
%dP = Dm * g * 12; % N
dP=columnF;

%% Vettore delle deformazioni, con un poco di rumore
%x = 1e-2*([1:1:10]); % m
%x = x + 1e-4*randn(size(x));
x=columnC;

%% Incertezza nelle deformazioni
Dx = 1e-3; % m
%dx = Dx / sqrt(6) * 12 ;
dx=columnD

%% Stime della costante elastica
k = P ./ x;

%% Stime dell'incertezza della costante elastica
dk = k .* sqrt((dx./x).^2 + (dP./P).^2);

%% Calcolo dei pesi statistici, come:
% inverso del quadrato dell'indeterminazione delle misure di deformazione
w = 1./(dk.^2);

%% Stima della costante elastica: media pesata dei rapporti forza/deformazione
k0 = media_pesata(k, w);

%% Incertezza nella stima della costante elastica: propagazione dell'errore 
dk0 = 1 ./ sqrt(sum(w));

%% Plot con barre d'errore sulle ordinate: errorbar
fig = figure();
h = errorbar(P, x, dx);
hh = get(h, 'children');
% La linea coi valori misurati
hh1 = hh(1);  
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
setbarwidth(h, P, 0.5)


%% Plot con barre d'errore sulle ascisse e sulle ordinate: errorbarxy
fig = figure();
h = errorbarxy(P, x, dP, dx);
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
setbarsize(h, P, 0.0, x, 0.0)

grid on
hold on

%% 3) regressione lineare (prop diretta)
% x = b0 * P
% Implemento la formula nel testo ;)
b0 = sum(P .* x) / sum(P.^2);
% Sfrutto il fatto che le incertezze sono tutte uguali
db = dx(1) / sum(P.^2);
    
%% 4) Calcolo delle previsioni del modello
model_x = b0 * P;

%% 5) Test del chi^2
chi2 = sum((model_x - x).^2 ./ dx.^2);
N = numel(x);
dof = N - 1;

%% 6) Plot del modello:
figure(fig)
p = plot(P, model_x);
set(p, 'color', [1 0 0])

%% 7) Incertezze 'a posteriori'
dx_p = sqrt(1/(dof) * sum((x - model_x).^2));

