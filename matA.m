function [A]= matA(v,del,Ybus,H)
% v is voltage magnitude of generetor 
% del is aggles of genetaror bus of generator in radian
% H is inertia constants of generators
% Ybus is redused bus admitance
m=H/188.5;
n=length(v);
K=zeros(n,n);
for i=1:n
    for j=1:n
        if i~=j
        K(i,j)=v(i)*v(j)*imag(Ybus(i,j))*cos(del(i)-del(j));
        end
    end
end
for i=1:n
    K(i,i)=-1*sum(K(i,:));
end
M=diag(m);
A=M\K;
