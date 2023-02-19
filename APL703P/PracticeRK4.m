%% Practice RK4 for exam %%
clear all; clc;
n= input('number of time steps');
x(1)=0; y(1)=1;

h=0.1;

f= @(x,y) -2*y+x^3*exp(-2*x);
for i = 1:n
    k1= h*f(x(i), y(i));
    k2= h*f(x(i)+h/2, y(i)+k1/2);
    k3= h*f(x(i)+h/2, y(i)+k2/2);
    k4= h*f(x(i)+h, y(i)+k3);
    
    y(i+1)= y(i)+(1/6)*(k1+2*k2+2*k3+k4);
    x(i+1)= x(i)+h;
end

plot(x,y, 'ro--');
    