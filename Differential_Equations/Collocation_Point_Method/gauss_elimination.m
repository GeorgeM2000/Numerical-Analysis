function C = gauss_elimination(A,B) % defining the function 
%A= [ 1 2; 4 5] % Inputting the value of coefficient matrix
%B = [-1; 4] % % Inputting the value of coefficient matrix
    i = 1; % loop variable
    X = [ A B ]; 
    [ nX mX ] = size( X); % determining the size of matrix   
    while i <= nX % start of loop 
        if X(i,i) == 0 % checking if the diagonal elements are zero or not
            disp('Diagonal element zero') % displaying the result if there exists zero 
            return
        end
        X = elimination(X,i,i); % proceeding forward if diagonal elements are non-zero
        i = i +1;
    end    
    C = X(:,mX);
end