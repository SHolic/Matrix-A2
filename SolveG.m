function [flag, b] = SolveG(a, b, intch)
    [n, s] = size(b);
    
    % interchage bk and bm
    for k = 1:n-1
        m = intch(k);
        tmp = b(k);
        b(k) = b(m);
        b(m) = tmp;
    end
    % column-oriented forward substitution
    for j = 1:n-1
        for i = j+1:n
            b(i) = b(i) - a(i,j)*b(j);
        end
    end
    flag = 0;
    for j = n:-1:1
        if a(j,j) == 0
            flag = 1;
            break
        end
        b(j) = b(j) / a(j,j);
        for i = 1:j-1
            b(i) = b(i) - a(i,j)*b(j);
        end
    end
end