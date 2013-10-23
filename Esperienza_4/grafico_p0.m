%analisi dati e grafico primo set dati
%pressione espressa in pascal
P0=p0*100;
P1=p1*100;
P2=p2*100;
P3=p3*100;
P4=p4*100;
P5=p5*100;
P6=p6*100;
P7=p7*100;
P8=p8*100;

%errore sulla pressione
d_p0 = P0.*0.05;
d_p1 = P1.*0.05;
d_p2 = P2.*0.05;
d_p3 = P3.*0.05;
d_p4 = P4.*0.05;
d_p5 = P5.*0.05;
d_p6 = P6.*0.05;
d_p7 = P7.*0.05;
d_p8 = P8.*0.05;
%calcolo dei parametri statistici
[a0,b0,d_a0,d_b0] = reglin(t0,P0,d_p0);
[a1,b1,d_a1,d_b1] = reglin(t1,P1,d_p1);
[a2,b2,d_a2,d_b2] = reglin(t2,P2,d_p2);
[a3,b3,d_a3,d_b3] = reglin(t3,P3,d_p3);
[a4,b4,d_a4,d_b4] = reglin(t4,P4,d_p4);
[a5,b5,d_a5,d_b5] = reglin(t5,P5,d_p5);
[a6,b6,d_a6,d_b6] = reglin(t6,P6,d_p6);
[a7,b7,d_a7,d_b7] = reglin(t7,P7,d_p7);
[a8,b8,d_a8,d_b8] = reglin(t8,P8,d_p8);
%test del chi quadro
chi0 = sum(sqrt(((P0-a0-b0.*t0)./d_p0).^2));
chi1 = sum(sqrt(((P1-a1-b1.*t1)./d_p1).^2));
chi2 = sum(sqrt(((P2-a2-b2.*t2)./d_p2).^2));
chi3 = sum(sqrt(((P3-a3-b3.*t3)./d_p3).^2));
chi4 = sum(sqrt(((P4-a4-b4.*t4)./d_p4).^2));
chi5 = sum(sqrt(((P5-a5-b5.*t5)./d_p5).^2));
chi6 = sum(sqrt(((P6-a6-b6.*t6)./d_p6).^2));
chi7 = sum(sqrt(((P7-a7-b7.*t7)./d_p7).^2));
chi8 = sum(sqrt(((P8-a8-b8.*t8)./d_p8).^2));
%calcolo del flusso
V = 0.005930;
d_V = 10^(-5);
Q0 = V*b0;
Q1 = V*b1-Q0;
Q2 = V*b2-Q0;
Q3 = V*b3-Q0;
Q4 = V*b4-Q0;
Q5 = V*b5-Q0;
Q6 = V*b6-Q0;
Q7 = V*b7-Q0;
Q8 = V*b8-Q0;

Q = [Q1;Q2;Q3;Q4;Q5;Q6;Q7;Q8];
G = [1;2;3;4;5;6;7;8];

%calcolo dell'errore sul flusso
%errore su Q0
d_Q0 = sqrt((b0*d_V)^2+(V*d_b0)^2);
%altri errori
d_Q1 = sqrt((b1*d_V)^2+(V*d_b1)^2+(d_Q0)^2);
d_Q2 = sqrt((b2*d_V)^2+(V*d_b2)^2+(d_Q0)^2);
d_Q3 = sqrt((b3*d_V)^2+(V*d_b3)^2+(d_Q0)^2);
d_Q4 = sqrt((b4*d_V)^2+(V*d_b4)^2+(d_Q0)^2);
d_Q5 = sqrt((b5*d_V)^2+(V*d_b5)^2+(d_Q0)^2);
d_Q6 = sqrt((b6*d_V)^2+(V*d_b6)^2+(d_Q0)^2);
d_Q7 = sqrt((b7*d_V)^2+(V*d_b7)^2+(d_Q0)^2);
d_Q8 = sqrt((b8*d_V)^2+(V*d_b8)^2+(d_Q0)^2);

d_Q = [d_Q1;d_Q2;d_Q3;d_Q4;d_Q5;d_Q6;d_Q7;d_Q8];

%grafico Q in funzione dei giri G
%h = errorbarxy(G,Q,0*ones(size(G)),d_Q, 'o');
%setbarsize(h,G, 0, Q, 0);
%grafico con barre d'errore
%plot(t0,p0)
%grafico di prova
Q1 = [Q1;Q2;Q3;Q4];
G1 = [1;2;3;4];
%plot(G,Q,'o');
%herrorbar(G,Q,d_Q);
plot(t4,P4)
