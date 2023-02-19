clear all; clc;
%%% Trapezoidal Rule %%%

syms x;
% f(x)=  1+x^2;
f(x)= sqrt(1+x^2);
a=1;
b=5;
n=20; %number of intervals.
h= (b-a)/n; %interval length


sum= (h/2)*(f(a)+f(b));

for i=1:(n-1)
    sum=sum+h*f(a+i*h);
end

double(sum)

exactIntegrationValue= double(int(f,x,1,5));

error= double(abs(sum-exactIntegrationValue));
