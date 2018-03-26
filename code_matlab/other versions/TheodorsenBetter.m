function [Ck] = TheodorsenBetter(k)
j0 = besselj(0, k);
j1 = besselj(1, k);
y0 = bessely(0, k);
y1 = bessely(1, k);

f = (j1*(j1 + y0) + y1*(y1 - j0)) / ((j1+y0)^2 + (j0-y1)^2);
g = -(y1*y0 + j1*j0) / ((j1+y0)^2 + (j0-y1)^2);
Ck = f + 1i * g;
end