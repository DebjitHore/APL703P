clear all; clc;
A= [1 1 1; 2 3 4; 3 4 2]; 
b= [6 20 17]';
d=det (A);
xDirect= inv(A)*b;
xDirect=A\b;


%% augmented matrix
Ab= [A, b]; 
k=2;
%%

%%% Gauss Elimination Technique.
rows= size(Ab,1);
while (k<4) %NUMBER OF UPDATION LOOPS   
    for i=k:3 %TWO SETS OF MULTIPLIERS TO BE GENERATED m2, m3 and m3'
        
        m(i) = Ab(i, k-1)/Ab(k-1,k-1);
        for j=k-1:4
            Ab(i,j)= Ab(i,j)-m(i)*Ab(k-1,j);
        end
    end
    k=k+1;
end

%% Extracting values of x.
b= Ab(:,4);
m=3;
sum=0;
x(m)=b(m)/Ab(m,m);
for i=m-1:-1:1
    sum=b(i);
    for j=i+1:3
        sum=sum-Ab(i,j)*x(j);
    end
    x(i)= sum/Ab(i,i);
end
