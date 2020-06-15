close all;
clear all;
clc;
 
 
load ang.mat;
load brunch_data.mat;
load Bus_serial.mat;
load gendata_p_q_h_x.mat;
load Gen_serial.mat;
load Load_bus.mat; 
load Vt.mat; 
F=brunch_data(:,1);
T=brunch_data(:,2);
Rt=brunch_data(:,3);
[Ybus]=bus_mat(F,T,Rt,Bus_serial);  % import Bus_serial 
[Y_R]=B_R(Ybus,L_B);  % reduced
p=pqhx(:,1); q=pqhx(:,2); h=pqhx(:,3); x=pqhx(:,4); col=pqhx(:,5); % import gendata_p_q_h_x
[P,Q,X,H] = pqadder(p,q,x,h,col);
P=P/100; Q=Q/100;  % IN Per Unit
[Eg,delta]=gen_V(Vt,ang,P,Q,X); % Vt and ang is saved, import Vt, ang
[A]= matA(Eg,delta,Y_R,H);
g=input('number of coherent groups: ');
[V,lamda]=eig(A);
V=V(:,1:g);
[U, r] = gecp(V);
for i=1:g
    V1(i,:)=V(r(i),:);
end
L=V/V1;
[ Final ] = co_grp(L,Gen_serial);
Final
