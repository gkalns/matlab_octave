function [ result ] = checkdiags( vect )
%checkdiags Check if any of queens can attack other diagonally. Returns true if no queen is endangered.

for i = 2:8,
   j = i-1;
    while j ~= 0,
        if vect(i)-j == vect(i-j)
            result = false;
            return
        elseif vect(i)+j == vect(i-j)
            result = false;
            return
        end
        j = j-1;
    end 
end
result = true;
end

