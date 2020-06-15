function [Y]=B_R(D,LB)
 
% close all; clear all; clc;
% Y is reduced bus admittance matrix
% D is bus admittance matrix
% x=input('bus number: ');
% D=zeros(x,x);
% for k=1:x*x
% 
%     i=input('branch admittance from bus# :');
%     j=input('to bus# :');
%     
%     if (i&j)==0
%         break
%     end
%     D(i,j)=1/input(['Branch from BUS# ' num2str(i)  ' to BUS# ' num2str(j)  ' :']);
%     D(j,i)=D(i,j);
%     
% end
% for i=1:x
%     D(i,i)=-1*sum(D(i,:));
% end
Y=D;
l=length(LB);
for i=1:l
    n=length(Y);
    Y1=Y;
    p=LB(i);
    for j=1:n
        for k=1:n
            Y(j,k)=Y1(j,k)-Y1(j,p)*Y1(p,k)/Y1(p,p);
        end
    end
    Y(p,:)=[];
    Y(:,p)=[];
    LB=LB-1;
end
Y;
