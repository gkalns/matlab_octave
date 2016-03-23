% This program computes answer to 8 queens puzzle. The puzzle is about putting queens on the chessboard in such a way that no queen can attack other.
% Program finds all 92 solutions and dislays them.
% Furthermore all mirrored and rotated arrangements are removed leaving 12 unique solutions. They are displayed.
% Solution vector shows the column number to put queen in each row.

tic;
% finds all permutations of 8 (this means that rows and columns will always work)
pe = perms([1 2 3 4 5 6 7 8]);
toc

% for all permutations check for conflicts on diagonals
% If no conflicts - one of solutions
sol = [];
for i = 1:length(pe),
    onevect = pe(i,:);
    if checkdiags(onevect) == true
        sol = [sol; onevect];
    end     
end
toc

% Delete solutions of rotated or mirrored solutions
sol2 = sol;
for i = 1:length(sol),
   current = sol2(i,:);
   if(isnan(current))
       continue
   end
  
  % rotated
   rotv = current;
   for j = 1:3,
       rotv = rot90(rotv);
       sol2 = searchanddestroy(sol2,rotv,i+1, length(sol2));
   end
   
   % mirrored
   mirrorv = current;
   for j = 1:8,
       mirrorv(j) = 9-mirrorv(j);  
   end
   sol2 = searchanddestroy(sol2,mirrorv,i+1, length(sol2));
   
   % mirrored and rotated
   for j = 1:3,
       mirrorv = rot90(mirrorv);
       sol2 = searchanddestroy(sol2,mirrorv,i+1, length(sol2));
   end    
end
toc

% Clean solution matrix out of NaNs
sol3 = [];
for i = 1:length(sol),
   current = sol2(i,:);
   if(isnan(current))
       continue
   end
   sol3 = [sol3; current];
end
toc

% Print solution with all options and print one with removed symmetries
sol
sol3
