function [a] = cholesky_outerproduct(a)
    % Check whether the matrix is a square matrix
    [n, m] = size(a);
    if n ~= m
        warning("This is not a square matrix, error.");
        a = [];
        return
    end  
    
    for i = 1:n
        if a(i,i) <= 0
            warning("This is not a positive definite matrix");
            a = [];
            return
        end

        % compute aii
        a(i,i) = sqrt(a(i,i));

        % compute aij
        for j = i+1:n
            a(i,j) = a(i,j) / a(i,i);    
        end
        
        % compute outer-product
        a(i+1:n, i+1:n) = a(i+1:n, i+1:n) - a(i, i+1:n)' * a(i, i+1:n);

        % get upper triangle
        a(i, 1:i-1) = zeros(i-1,1);
    end
end