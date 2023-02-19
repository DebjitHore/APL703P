%%% Solution of Boundary Value Probem using Finite Difference Method %%%

%% u''= 6t u(0)= 0; u(1)= 8; ORIGINAL FUNCTION %%
%% u'' +u=0 u(0)=1; u(9pi/2)=0 %%
%%
clear all; clc;

%%
n= input('Number of grid points');
% a=0; b=1;
a=0; b=(9*pi)/2;
h=(b-a)/n;
t= a+(1:n-1)'*h;
% B= 6*h^2*t;
B= 0*t;
% b(1,1)=b(1,1)-0; % 0 is the prescribed value of u at t=0
% b(n-1,1)= b(n-1,1)-8; % 8 is the prescribed value of u at t=1
B(1,1)=-1; % 0 is the prescribed value of u at t=0
B(n-1,1)= B(n-1,1)-0; % 0 is the prescribed value of u at t=1

% rows= [-2 1 zeros(1,n-3)];
% columns= [-2 1 zeros(1,n-3)];

rows= [(h.^2-2) 1 zeros(1,n-3)];
columns= [(h.^2-2) 1 zeros(1,n-3)];
A= toeplitz(columns, rows);

u= A\B;
% v= t.^3+7*t;
v=  cos(t);
plot(t,u,'k-', t, v, 'ro');
%%