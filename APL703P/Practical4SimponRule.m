clear all; clc;
%%% Simpon's rule for numerical integration. %%%

%Total number of points is always ODD, total number of intervals is even.


syms x;
% f(x)=  1+x^2;
% f(x)= sqrt(1+x^2+x^4);
f(x)= exp(x)+(x^2);
a=1; b=5; 
n=50; %Number of intervals
h=(b-a)/n;

sum= (h/3)*(f(a)+f(b));

for i= 1: 2: n-1
    sum= sum+(4*h/3)*f(a+i*h);
end

for j=2:2:n-2
        sum= sum+(2*h/3)*f(a+j*h);
end
double(sum)

analyticalIntegration= int(f,x,1,5);
double(analyticalIntegration)

error= double(sum-analyticalIntegration);
display(error);