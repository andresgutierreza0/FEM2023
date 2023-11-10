function [sigma, epsilon] = LAB1stressstrqain(K, fext, H, B, mater)
%LAB1STRESSSTRQAIN Summary of this function goes here
%   Detailed explanation goes here
    q = K\fext;
    
    sigma = H * B * q
    
    nondiag = 0;
    diag = 0;

    for i = 1:3
        for j = 1:3
            if i == j
                diag = mater(2)*sigma(i,j);
            else
                nondiag = (1+mater(2))*sigma(i,j);
            end
        end
    end

    epsilon = 1/mater(1)*(diag-nondiag);

end

