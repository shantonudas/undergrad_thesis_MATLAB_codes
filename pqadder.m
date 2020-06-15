function [P,Q,X,H] = pqadder(p,q,x,h,col)
P=zeros(41,1);
Q=P; X=P; H=P;
P(1)=p(1);
q(1)=q(1);
X(1)=x(1);
j=1;
for i=2:length(p)
  
    if (col(i)~=col(i-1))
       j=j+1;
    end
   
   P(j)=P(j)+p(i);
   Q(j)=Q(j)+q(i);
   H(j)=H(j)+h(i);
   
end
j=1;
for i=2:length(x)
  
    if (col(i)~=col(i-1))
       j=j+1;
       X(j)=x(i); 
    else
        X(j)=1/(1/X(j)+1/x(i));
    end
       
end
