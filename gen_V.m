function [Eg,delta]=gen_V(Vt,ang,P,Q,Xd)
% Eg is generator voltage in pu
% delta is generator swing angle in rad
% ang is generator bus angles in degree
% P & Q in P.U
theta=ang*pi/180;
l=length(Vt);
V=zeros(l,1);
delta=zeros(l,1);
 
for a=1:l
    I(a)=conj((P(a)+Q(a)*1i)/Vt(a)*(cos(theta(a))+1i*sin(theta(a))));
%     E(a)=Vt(a)+(R(a)+Xd(a)*1i)*I(a);
    E(a)=Vt(a)+(Xd(a)*1i)*I(a);
    V(a)=abs(E(a));
    delta(a)=angle(E(a));
end
 
Eg=V;
