function [Ke, H, B] = getstiffness(A1, mater)
%SHAPE_FUNCTION Summary of this function goes here
%   Detailed explanation goes here

if size(A1) == [4 3]
    A1 = A1';
end
V = 1/3;
A = [1 1 1 1; A1];
Ai = inv(A)/(6*V);
Ve = 1/6 * det(A);

B = [];
for i = 1:size(A, 1)
    Be = [
        Ai(2,i) 0 0;
        0 Ai(3,i) 0;
        0 0 Ai(4,i);
        Ai(3,i) Ai(2,i) 0;
        Ai(4,i) 0 Ai(2,i);
        0 Ai(4,i) Ai(3,i)];
    B = [B Be]
    size(B)
end

H = mater(1)*(1-mater(2))/((1+mater(2))*(1-2*mater(2)))*[
    1 mater(2)/(1-mater(2)) mater(2)/(1-mater(2)) 0 0 0;
    mater(2)/(1-mater(2)) 1 mater(2)/(1-mater(2)) 0 0 0;
    mater(2)/(1-mater(2)) mater(2)/(1-mater(2)) 1 0 0 0;
    0 0 0 (1-2*mater(2))/2*(1-mater(2)) 0 0;
    0 0 0 0 (1-2*mater(2))/2*(1-mater(2)) 0;
    0 0 0 0 0 (1-2*mater(2))/2*(1-mater(2))]

Ke = B' * H * B * Ve;

