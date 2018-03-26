function [Cd] = DragBetter(alpha, Cl)
% Cd = coefficient of drag 
% alpha = angle of attack
% Cl = coefficient of lift

load alphacdcl % opens table of corresponding alpha (AlphaTable), Cd (CDTable), and Cl (CLTable) values
CLoverCDTable = CLTable./CDTable; % CLoverCDTable = vector of Cl/Cd from table values
result = interp1(AlphaTable, CLoverCDTable, alpha); % result = interpolation of graph of Cl/Cd values
Cd = Cl / result; % calculating Cd from the input Cl and the interpolation of Cl/Cd
end