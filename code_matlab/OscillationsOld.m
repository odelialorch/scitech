function [t, theta, flowAngle, hDot, alpha] = Oscillations(St)
Re = 4e4;
v = 1.004e-6; % m^2/s
c = 0.1; % m
U = 0.4; % m/s
h0overC = 0.75; % 1
h0 = h0overC * c; % m
alphaMax = deg2rad(15); % rad (1)
phi = pi/2; % rad (1)
omega = St * U / (4 * pi * h0) % rad (1)

theta0 = (St/(4 * pi)) % rad (1)
T = 2 * pi / omega; % s
t = linspace(0,T);

%h = h0 * sin(t * omega);
hDot = h0 * omega * cos(t * omega);
theta = theta0 * sin(omega * t + phi);
flowAngle = atan(hDot / U);
alpha = theta-flowAngle;
t = t / T;
end