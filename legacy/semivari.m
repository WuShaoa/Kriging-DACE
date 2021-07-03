function [r] = semivari(i,j,z)
    delta2 = var(z);
    c = mean(z);
    ri = z(i) - c;
    rj = z(j) - c;
    temp = delta2 - cov(ri,rj);
    r = temp(1);
end