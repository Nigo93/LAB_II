function [A,B,d_a,d_b] = reglin( X,Y,DY )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%W=1./DY.^2;
W=1./DY.^2;

DELTA=(sum(W).*sum(W.*(X.^2)))-(sum(W.*X))^2;

A=(sum((X.^2).*W)*sum(Y.*W)-sum(X.*W)*sum(Y.*X.*W))/DELTA;
B=(sum(W)*sum(Y.*X.*W)-(sum(X.*W))*sum(Y.*W))/DELTA;

d_a = sqrt((sum(W.*(X.^2)))./DELTA);
d_b = sqrt((sum(W))./DELTA);
%f = figure();
%g = plot(X,Y,'o');
%hold on;
%g1 = plot(x_range, A + B*x_range);
%ylim(gca, [0 max(Y)]);



end

