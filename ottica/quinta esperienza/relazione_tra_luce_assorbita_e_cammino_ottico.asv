l=[20; 25; 30; 35; 40; 50; 60; 70];
I=[55.9; 44.3; 37.4; 25; 23.5; 19.8; 14.8; 10.3]+4.3;
c=0.125 %inventato D:


y=log(I);
X=c.*l;
dy=y.*0.01;
dx=X.*0.01;
%linReg(x,y);
[A,B,d_a,d_b] = reglin( X,y,dy )
plot(l,y)
hold on
cacca=[0:0.01:100]
grid on
plot(cacca,B*cacca+A)
