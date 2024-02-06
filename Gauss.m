function [flag, intch, a] = Gauss(a)
    % Check whether the matrix is a square matrix
    [n, s] = size(a);
    if n ~= s
        warning("This is not a square matrix, error.");
        a = [];
        return
    end

    intch = zeros(1, n);
    flag = 0;
    for k = 1:n-1
        [amax, m] = max(abs(a(k:n, k)));
        m = m + k - 1; % adjust the m index
        if amax == 0
            flag = 1;
            % intch(k) = 0;
        else
            intch(k) = m;
            % interchange rows k and m
            if m ~= k
                tmp = a(k,:);
                a(k,:) = a(m,:);
                a(m,:) = tmp;
            end
            % row operations
            for i = k+1:n
                a(i,k) = a(i,k) / a(k,k);
                a(i,k+1:n) = a(i,k+1:n) - a(i,k)*a(k,k+1:n);
            end
        end
    end
    if a(n,n) == 0
        flag = 1;
        % intch(n) = 0;
    else
        intch(n) = n;
    end
end