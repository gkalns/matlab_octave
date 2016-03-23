function [ rotv ] = rot90( vect )
%rot90 Outputs vector of queen arrangement if chessboard is rotated 90 degrees.

    rotv = zeros(1,8);
    for i = 1:8,
        k = find(vect == i);
        rotv(i) = 9-k;
    end

end

