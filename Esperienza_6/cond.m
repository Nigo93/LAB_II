% scriptptptptptpt

% #1 tubo lungo nostro
pt1=[0.0512;0.055;0.11;0.65;3.2];
pc1=[2.346;2.546;5.505;20.7;47.3];
% ritorno
pt1_r=[0.04;0.46;0.1;0.65;3.2];
pc1_r=[1.79;2.06;5.3;20.34;47.3];

% #2 tubo più corto bluetto trasparente 
pt2=[0.023;0.025;0.075;0.65;3.2];
pc2=[0.3262;0.3890;1.45;5.8;15.39];
% ritorno
pt2_r=[0.019;0.024;0.075;0.65;3.2];
pc2_r=[0.28;0.36;1.45;5.8;15.39];

% #3 corto trasparente 
pt3=[0.012;0.015;0.065;0.65;3.2];
pc3=[0.493;0.79;3.41;14.5;35.1];
% ritorno
pt3_r=[0.0085;0.015;0.065;0.65;3.2];
pc3_r=[0.37;0.74;3.4;14.3;35.1];

% #4 lungo altri gruppi
pt4=[0.04;0.044;0.1;0.65;3.2];
pc4=[4.17;4.96;12.8;46;290];
% ritorno
pt4_r=[0.032;0.036;0.09;0.65;3.2];
pc4_r=[3.4;4;13;46;290];

% #5 tubi in acciaio proffffffffff
pt5=[0.0035;0.006;0.05;0.58;3];
pi5=[0.022;0.061;0.4;2;5.4];
pc5=[0.368;0.438;0.906;2.8;6.73];
% ritornoo
pt5_r=[0.003;0.0056;0.05;0.59;3.0];
pi5_r=[0.02;0.061;0.4;2.0;5.4];
pc5_r=[0.366;0.437;0.907;2.81;6.73];

% pasacaaaalllll
pt1_pas=pt1.*100;
pt2_pas=pt2.*100;
pt3_pas=pt3.*100;
pt4_pas=pt4.*100;
pt5_pas=pt5.*100;
%ritorno
pt1_rpas=pt1_r.*100;
pt2_rpas=pt2_r.*100;
pt3_rpas=pt3_r.*100;
pt4_rpas=pt4_r.*100;
pt5_rpas=pt5_r.*100;
%andata coda
pc1_pas=pc1.*100;
pc2_pas=pc2.*100;
pc3_pas=pc3.*100;
pc4_pas=pc4.*100;
pc5_pas=pc5.*100;
% ritorno coda
pc1_rpas=pc1_r.*100;
pc2_rpas=pc2_r.*100;
pc3_rpas=pc3_r.*100;
pc4_rpas=pc4_r.*100;
pc5_rpas=pc5_r.*100;
%intermedi
pi5_pas=pi5.*100;
%ritono intemedio
pi5_rpas=pi5_r.*100;

% valori di flusso
q=[0.0000297;0.000206;0.00318;0.0493;0.3];
dq=[0.0000002;0.0000009;0.0000318;0.000493;0.003];

% calcolo della conduttanza 

%per calcolare la conduttanza ad ongi singolo regime ho calcolato 
%la media fra andata e ritorno

mpt1=(pt1_pas+pt1_rpas)./2;
mpt2=(pt2_pas+pt2_rpas)./2;
mpt3=(pt3_pas+pt3_rpas)./2;
mpt4=(pt4_pas+pt4_rpas)./2;


%coda
mpc1=(pc1_pas+pc1_rpas)./2;
mpc2=(pc2_pas+pc2_rpas)./2;
mpc3=(pc3_pas+pc3_rpas)./2;
mpc4=(pc4_pas+pc4_rpas)./2;


% calcolo del Dp
Dp1=mpc1-mpt1; %tubo 1
Dp2=mpc2-mpt2; %tubo 2
Dp3=mpc3-mpt3; %tubo 3
Dp4=mpc4-mpt4; %tubo 4


% CONDUTTANZA
c1=q./Dp1;
c2=q./Dp2;
c3=q./Dp3;
c4=q./Dp4;

%CONDUTTANZA per tubi di acciaio in serie
mpt5=(pt5_pas+pt5_rpas)./2;%testa (vicino all pompa)
mpi5=(pi5_pas+pi5_rpas)./2;%intermedia
mpc5=(pc5_pas+pc5_rpas)./2;%finale (vicino alla spillo)

Dp_ci=mpc5-mpi5;
Dp_it=mpi5-mpt5;

C_ci=q./Dp_ci;%conduttanza coda-intermedia
C_it=q./Dp_it;%conduttanza intermdia-finale


z=(1./C_ci)+(1./C_it);%calcolo della conduttanza di due tubi in serie

%media per regime laminare
pci=(mpc5+mpi5)./2;
pit=(mpi5+mpt5)./2;

%regime laminare dei tubi separati
ci_lam=1350.*((pci.*(0.008^4))./1.45);
ct_lam=1350.*((pit.*(0.008^4))./1.45);

%calcolo per somma dei tubi
m5_me=(mpt5+mpc5)./2;
c5_lam=1350.*((m5_me.*(0.008^4))./2.9);

%REGIME DI FLUSSO
Re5=(4./(3.1415.*0.0000181*0.008)).*(0.02946./(8.31.*293)).*q;

%REGIME DI FLUSSO LAMINARE
p1_me=(mpt1+mpc1)./2;
p2_me=(mpt2+mpc2)./2;
p3_me=(mpt3+mpc3)./2;
p4_me=(mpt4+mpc4)./2;
%calcolo in regime laminare
c1_lam=1350.*((p1_me.*(0.004^4))./8);
c2_lam=1350.*((p2_me.*(0.004^4))./0.8);
c3_lam=1350.*((p3_me.*(0.0025^4))./0.8);
c4_lam=1350.*((p4_me.*(0.0025^4))./8);

%calcolo in regime molecolare
c1_mo=120.*((0.004^3)./8);
c2_mo=120.*((0.004^3)./0.8);
c3_mo=120.*((0.0025^3)./0.8);
c4_mo=120.*((0.0025^3)./8);

%calcolo del numero di raynolds per differenti tubi con differenti diametri
%e regimi di flusso differenti
Re1=(4./(3.1415.*0.0000181*0.004)).*(0.02946./(8.31.*293)).*q;
Re2=(4./(3.1415.*0.0000181*0.004)).*(0.02946./(8.31.*293)).*q;
Re3=(4./(3.1415.*0.0000181*0.0025)).*(0.02946./(8.31.*293)).*q;
Re4=(4./(3.1415.*0.0000181*0.0025)).*(0.02946./(8.31.*293)).*q;

%calcolo errori sulla pressione
mpt1_er=mpt1.*0.05;
mpt2_er=mpt2.*0.05;
mpt3_er=mpt3.*0.05;
mpt4_er=mpt4.*0.05;


%coda
mpc1_er=mpc1.*0.05;
mpc2_er=mpc2.*0.05;
mpc3_er=mpc3.*0.05;
mpc4_er=mpc4.*0.05;

%calcolo errore sulla conduttanza
d_p1=sqrt(mpt1_er.^2+mpc1_er.^2);
d_p2=sqrt(mpt2_er.^2+mpc2_er.^2);
d_p3=sqrt(mpt3_er.^2+mpc3_er.^2);
d_p4=sqrt(mpt4_er.^2+mpc4_er.^2);

d_c1=sqrt((dq./d_p1).^2 + ((q./d_p1.^2) .* d_p1).^2);
d_c2=sqrt((dq./d_p2).^2 + ((q./d_p2.^2) .* d_p2).^2);
d_c3=sqrt((dq./d_p3).^2 + ((q./d_p3.^2) .* d_p3).^2);
d_c4=sqrt((dq./d_p4).^2 + ((q./d_p4.^2) .* d_p4).^2);

