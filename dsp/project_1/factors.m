function factors = factors(n)
    % This function returns the smallest factors of an integer n
    factors = [];
    factor = 2;
    while n > 1
        while mod(n, factor) == 0
            factors(end+1) = factor; %#ok<AGROW>
            n = n / factor;
        end
        factor = factor + 1;
    end
end