function [t, theta, flowAngle, hDot, alpha] = Oscillations(St)
%St = 0.1;
h0 = 0.05;
U = 0.4;
omega = St * U / (4 * pi * h0);
T = 2 * pi / omega;
t = linspace(0,T);
alphaMax = deg2rad(15);
theta0 = St * pi + alphaMax;
phi = pi / 2;

h = h0 * sin(omega * t);
hDot = h0 * omega * cos(omega * t);
flowAngle = -atan(hDot / U);
theta = theta0 * sin(omega * t + phi);
alpha = theta + flowAngle;
%disp(rad2deg(theta));
%disp(rad2deg(flowAngle));
%disp(rad2deg(alpha));
t = t / T;
