clear all; clc;
%%% Newton Rapshon Method %%%

syms x;
% f(x)= x-2*sin(x);
f(x)= exp(2*x)-x-6;
g(x)= diff(f,x);

x0=1.2;

N=1;

x1=x0-f(x0)/g(x0);
Error= double(abs(x1-x0));

while Error> 0.00001
    x0=x1;
    x1=x0-f(x0)/g(x0);
    Error= double(abs(x1-x0));
    N=N+1;
end

double(x0);
%%%Plot function%%%

x= linspace(0,4,20);
y=f(x);
plot(x,y);