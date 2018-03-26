function [Cl] = LiftBetter(a, b, theta0, h0)
% Cl = coefficient of lift
% a = # of semi-chords the foil is from the mid-chord (measure of distance)
% b = length of semi-chord 
% theta0 = max pitch angle (at centerpoint)
% h0 = heave amplitude

%% Constants
f = 0.5; % f = circular frequency
t = linspace(0, 2 / f); % t = time
St = 0.3; % St = Strouhal number 
w = 2*pi * f; % w = Angular velocity = circle * circular freq
phi = pi / 2; % phi = Phase difference between heave and pitch

%% Variables Dependent on Inputs
h = h0 * sin(w*t); % h = heave position at any time                
theta = theta0 * sin(w*t + phi); % theta = pitch angle at any time
V = f * 2 * h0 / St; % V = velocity of uniform flow (water)
k = w * b / V; % k = reduced frequency
Ck = TheodorsenBetter(k); % Ck = Theodorsen number of k

%% Derivatives 
dTheta = theta0 * w * cos(w*t + phi); % dTheta = derivative of theta = pitch velocity
d2Theta = -theta0 * w^2 * sin(w*t + phi); % d2Theta = derivative^2 of theta = pitch acceleration
dh = h0 * w * cos(w*t); %dh = derivative of h = heave velocity
d2h = -h0 * w^2 * sin(w*t); %d2h = derivative^2 of h = heave acceleration

%% Coefficient of Lift Equation
Cl1 = pi * b / V * (dTheta + (d2h / V) - (b*a*d2Theta / V)); %Cl1 = first half of Cl equation
Cl2 = 2*pi*Ck*((dh / V) + theta + b*(1/2 - a)*dTheta / V); %Cl2 = second half of Cl equation

Cl = Cl1 + Cl2; 

end