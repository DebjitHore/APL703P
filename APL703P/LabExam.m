
clear all;
clc;
n=input('grid points :');
x(1)=0; %% x=t, t=x, z=dy/dx
y(1)=1;
z(1)=0; %% z=dy/dx
h=0.0628;
f=@(x,y,z) z;
g=@(x,y,z) -8*(y^2-1)*z-y;
for i=1:n
    k1=h*f(x(i),y(i),z(i));
    m1=h*g(x(i),y(i),z(i));
    k2=h*f(x(i)+0.5*h,y(i)+0.5*k1,z(i)+0.5*m1);
    m2=h*g(x(i)+0.5*h,y(i)+0.5*k1,z(i)+0.5*m1);
    k3=h*f(x(i)+0.5*h,y(i)+0.5*k2,z(i)+0.5*m2);
    m3=h*g(x(i)+0.5*h,y(i)+0.5*k2,z(i)+0.5*m2);
    k4=h*f(x(i)+h,y(i)+k3,z(i)+m3);
    m4=h*f(x(i)+h,y(i)+k3,z(i)+m3);
    y(i)=y(i)+(1/6)*(k1+k4+2*(k2+k3));
    z(i)=z(i)+(1/6)*(m1+m4+2*(m2+m3));
    x(i)=x(i)+h;
end

plot(x,y,'m--',x,z);











