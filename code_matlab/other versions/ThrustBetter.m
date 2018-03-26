function [Ct, Cn, t] = ThrustBetter(a, b, theta0, h0)
% Ct = constant of thrust
% a = # of semi-chords the foil is from the mid-chord (measure of distance)
% b = length of semi-chord 
% theta0 = max pitch angle (at centerpoint)
% h0 = heave amplitude

%% Constants
f = 0.5; % f = circular frequency
t = linspace(0, 2 / f); % t = time
St = 0.3; % St = Strouhal number
w = 2*pi * f; % Angular velocity = circle * circular freq
phi = pi / 2; % Phase difference between heave and pitch

%% Variables Dependent on Inputs
U = f * 2 * h0 / St; % U = velocity of uniform flow (water)
dh = h0 * w * cos(w*t); %dh = derivative of h = heave velocity
theta = theta0 * sin(w*t + phi); % theta = pitch angle at any time
gamma = atan(dh/U); % gamma = angle of relative flow
beta = pi/2 - gamma; % beta = angle between lift and thrust
alpha = theta + gamma; % alpha = angle of attack

%% Constant of Thrust Equation, in terms of Cl and Cd
Cl = LiftBetter(a, b, theta0, h0); % Cl = coefficient of lift
Cd = DragBetter(alpha, Cl); % Cd = coefficient of drag
Ct = Cl.*cos(beta)-Cd.*sin(beta);
Cn = Cl.*sin(beta)+Cd.*cos(beta);
end