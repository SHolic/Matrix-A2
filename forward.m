function [b] = forward(a,b)
    % Check whether the matrix is a square matrix
    [n, m] = size(a);
    if n ~= m
        warning("This is not a square matrix, error.");
        a = [];
        return
    end

    b(1) = b(1)/a(1,1);
    for i = 2:n
        for j = 1:i-1
            b(i) = b(i) - a(i,j)*b(j);
        end
        b(i) = b(i) / a(i,i);
    end
end