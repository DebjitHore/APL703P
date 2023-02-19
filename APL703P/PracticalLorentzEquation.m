%%% Loretnz Equation %%%
clear all; clc;
n= input('Enter number of timesteps');

x(1)= 0.00005;
y(1)= 1.00004;
z(1)= 0.00003;
h= 0.01;
sigma= 10; r= 28; b= 8/3;
for i=1:n
    k1= h*sigma*(y(i)-x(i));
    l1=h*(r*x(i)-y(i)-x(i)*z(i));
    m1= h*(x(i)*y(i)-b*z(i));

    k2= h*(sigma*((y(i)+l1/2)-(x(i)+k1/2)));
    l2= h*(r*(x(i)+k1/2)-(y(i)+l1/2)-((x(i)+k1/2)*(z(i)+m1/2)));
    m2= h*((x(i)+k1/2)*(y(i)+l1/2)-b*(z(i)+m1/2));

    k3= h*(sigma*((y(i)+l2/2)-(x(i)+k2/2)));
    l3= h*(r*(x(i)+k2/2)-(y(i)+l2/2)-((x(i)+k2/2)*(z(i)+m2/2)));
    m3= h*((x(i)+k2/2)*(y(i)+l2/2)-b*(z(i)+m2/2));

    k4= h*(sigma*((y(i)+l3)-(x(i)+k3)));
    l4= h*(r*(x(i)+k3)-(y(i)+l3)-((x(i)+k3)*(z(i)+m3)));
    m4= h*((x(i)+k3)*(y(i)+l3)-b*(z(i)+m3));
    x(i+1)= x(i)+(1/6)*(k1+2*k2+2*k3+k4);
    y(i+1)= y(i)+(1/6)*(l1+2*l2+2*l3+l4);
    z(i+1)= z(i)+(1/6)*(m1+2*m2+2*m3+m4);

end

% figure(1)
% plot(t,x,t,y,'r--', t,z, 'bo');
subplot(1,3,1)
plot(x,y);
subplot(1,3,2)
plot(x,z);
subplot(1,3,3)
plot(y,z);

figure
plot(x,z);
