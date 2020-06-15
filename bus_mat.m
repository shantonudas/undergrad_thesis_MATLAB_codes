function [ Ybus ] = bus_mat(Fr,To,Reactance,Real)
% Real is sequence of bus 
% Fr is from bus
% To is to bus
num=length(Real);
Z=1i*Reactance;
for i=1:length(Fr)
    for j=1:length(Real)
    if (Fr(i)==Real(j))
        x(i)=j;
    end
    end
end
for i=1:length(To)
    for j=1:length(Real)
    if (To(i)==Real(j))
        y(i)=j;
    end
    end
end
Ybus=zeros(num);
for n=1:length(x)
    Ybus(x(n),y(n))=Ybus(x(n),y(n))-1/Z(n);
    Ybus(y(n),x(n))=Ybus(x(n),y(n));
end
for n=1:num
    Ybus(n,n)=-1*sum(Ybus(n,:));
end
