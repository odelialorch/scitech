%% BACKWARDS ALGORITHM

%% input variables 
function [r,phi0,m] = NitzansBackwardsKinematics(theta0,h0,L)
close all
r = h0/sqrt(2);
BarDistance = 30;

phistar = 2 * asin((sin(pi/4)*(BarDistance*tan(theta0)))/(2*r));

alphas = [5.3 10.6 15.9 21.2 26.5; pi 3*pi/2 0 pi/2 pi];
[~, closestIdx] = min(abs(alphas - r), [], 2);
dAlpha = alphas(2, closestIdx(1));
phi0 = mod(2 * dAlpha + phistar, 2*pi);

dDivets = 3.75; % Distance between divets
d = 500; % Distance between axis of symmetry and center of wheel
D = 100; % Distance between bar and center of wheel
dBar = 400; % Distance between foil and first divet

eqAlpha = deg2rad(180) - phistar / 2; % Alpha of equilibrium
q = D - r*sin(eqAlpha) + r*cos(eqAlpha); % Distance between pin and center of wheel at eq

l = d + q - L;

m = (dBar - l) / dDivets;
phistar = rad2deg(phistar)
phi0 = rad2deg(phi0)
end