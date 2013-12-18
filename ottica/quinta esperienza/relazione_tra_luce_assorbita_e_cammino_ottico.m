% lunghezza del cammino ottico
l=[20; 25; 30; 35; 40; 50; 60; 70];
%offset dello strumento
off=4.3;
% Intensità luminosa
I=[55.9+off; 44.3+off; 37.4+off; 25+off; 23.5+off; 19.8; 14.8; 10.3];
c=0.132  %inventato D:

%calcolo dei parametri x e y per Y=a+bx
y=log(I);
X=c.*l;
%errore sui dati sperimentali
dy=y.*0.01;
dx=X.*0.01;
% calcolo della regressione lineare
[A,B,d_a,d_b] = reglin( X,y,dy )
io=exp(A)

