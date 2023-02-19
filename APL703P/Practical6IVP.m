%%% Initial Value Problem. Euler Method %%%

clear all; clc;
n= input('Number of time steps : ');
t(1)=0; y(1)=1; u(1)=1; v(1)=1;
h= 0.01;

%% Eulers Method %%
for i=1:n
    y(1+i)= y(i)+h*(-2*y(i)+2-exp(-4*t(i)));
    t(i+1)=t(i)+h;
end

%% Modified Euler Method %%
for i= 1:n
        u(i+1)= u(i)+h*(-2*u(i)+2-exp(-4*t(i))); %Solution for Euler method
        t(i+1)=t(i)+h;
        v(i+1)= v(i)+0.5*h*(-2*v(i)+2-exp(-4*t(i))-2*u(i+1)+2-exp(-4*t(i+1)));
%       u(i+1)=v(i+1);
        u(i+1)= v(i+1);
end
%% Analytical Solution %%

x=linspace(0,1,20);
analyticalSolution= 1+0.5*exp(-4*x)-0.5*exp(-2*x);
plot(t,y, x, analyticalSolution, 'ko', t,v, 'r--');