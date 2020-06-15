function [U, r] = gecp(A)
%GECP calculate Gauss elimination with complete pivoting
% (G)aussian (E)limination (C)omplete (P)ivoting
% Input : A nxn matrix
% U = Upper triangular matrix
[n, m] = size(A);
c = 1:n; 
q = 1:m;
for k = 1:m
    [maxc, rowindices] = max( abs(A(k:n, k:m)) );
    [maxm, colindex] = max(maxc);
    row = rowindices(colindex)+k-1; col = colindex+k-1;
    A( [k, row], : ) = A( [row, k], : );
    A( :, [k, col] ) = A( :, [col, k] );
    c( [k, row] ) = c( [row, k] ); q( [k, col] ) = q( [col, k] );
    if A(k,k) == 0
      break
    end
    A(k+1:n,k) = A(k+1:n,k)/A(k,k);
    i = k+1:m;
    A(i,i) = A(i,i) - A(i,k) * A(k,i);
end
r=c;
U = triu(A);
