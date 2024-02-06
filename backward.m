function [b] = backward(a,b)
    % Check whether the matrix is a square matrix
    [n, m] = size(a);
    if n ~= m
        warning("This is not a square matrix, error.");
        a = [];
        return
    end

    b(n) = b(n)/a(n,n);
    for i = n-1:-1:1
        for j = i+1:n
            b(i) = b(i) - a(i,j)*b(j);
        end
        b(i) = b(i) / a(i,i);
    end
end