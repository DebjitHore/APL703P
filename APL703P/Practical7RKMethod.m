%%% Runge Kutta Method %%%
% y_n+1= y_n+aK1+bK2;

clear all; clc;

n= input('Enter number of time steps you want');

x(1)=0; y(1)=1; t(1)=0; h=0.01;


for i=1:n
    k1= h*y(i);
    l1= -h*x(i);
    k2= h*(y(i)+l1/2);
    l2= -h*(x(i)+k1/2);
    k3= h*(y(i)+l2/2);
    l3= -h*(x(i)+k2/2);
    k4= h*(y(i)+l3);
    l4= -h*(x(i)+k3);
    x(i+1)= x(i)+ (1/6)*(k1+2*k2+2*k3+k4);
    y(i+1)= y(i)+(1/6)*(l1+2*l2+2*l3+l4);
    t(i+1)=t(i)+h;

end

%%% Analytical Solution

z= linspace(0,20,10);
u=sin(z);
v=cos(z);
figure(1)
plot(t,x,t,y,'r--', z,u, 'b*', z,v,'ro');
figure(2)
plot(x,y);
