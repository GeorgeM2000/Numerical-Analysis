function X = elimination(X,i,j)
% Pivoting (i,j) element of matrix X and eliminating other column
% elements to zero
[ nX mX ] = size( X); 
a = X(i,j);
X(i,:) = X(i,:)/a;
for k =  1:nX % loop to find triangular form 
    if k == i
        continue
    end
    X(k,:) = X(k,:) - X(i,:)*X(k,j); % final result 
end