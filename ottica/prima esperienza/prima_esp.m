%vettori p, q, h1 e valore di h0 espressi in cm
P = [23.5; 24.5; 25; 25.5; 26; 26.5; 27; 27.5; 28; 32; 36; 40];
Q = [138.5; 110.5; 101.5; 94.5; 88; 82.5; 77.5; 73.5; 70.5; 52.5; 44; 39.5];
h1 = [5.655; 4.395; 3.970; 3.615; 3.300; 3.060; 2.820; 2.650; 2.435; 1.605; 1.195; 0.985];

%stima degli errori su q e su p
d_P = 0.3/sqrt(12);
d_Q = 0.5/sqrt(12);

%stima degli errori su 1/p e 1/q
d_1suP = d_P.*(1./P).^2;
d_1suQ = d_Q.*(1./Q).^2;

%grafico di 1/p in funzione di 1/q
plot(1./Q, 1./P, 'o');

%grafico con errori
h = errorbarxy(1./Q, 1./P, d_1suQ, d_1suP);
setbarsize(h, 1./Q, 0, 1./P, 0);

%regressione lineare
[a,b,d_a,d_b] = reglin( 1./Q, 1./P, d_1suP );

%test del chi quadro
chi2 = sum(sqrt(((1./P-a-b*1./Q)./d_1suP).^2));

%calcolo della distanza focale f
f = 1/a;
%calcolo dell'errore su f
d_f = d_a*(1/a)^2;