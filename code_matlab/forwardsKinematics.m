%% FORWARDS ALGORITHM

%% input variables
function [theta0,h0,L] = forwardsKinematics(r,phi0,m,alpha1)
clc;

%% setting alpha by r
if r == 5.3
    alpha = 3*pi/2; %starting alpha on first wheel
elseif r == 10.6
    alpha = 0;
elseif r == 15.9
    alpha = pi/2; 
elseif r == 21.2
    alpha = pi;
else
    alpha = 3*pi/2;
end
    
%% solve for h0
d = 44.3;   % d = distance from center of wheel to pole
alpha2 = 2.*pi-alpha1-phi0;  % alpha2 = angle position of second wheel at start
                            % alpha1 = angle position of first wheel at start
                            % phi0 = phase difference at start
h1 = r.*sin(alpha1)+r.*cos(alpha1)+d+3.75.*(m-1);  % h1 = distance of first pole at any point
                                                % r = radius of wheel
                                                % m = # divet on the pole (from inwards out)
h2 = r.*sin(alpha2)+r.*cos(alpha2)+d+3.75.*(m-1);  % h2 = distance of second pole at any point
h0 = (r*sqrt(2))/2 %output
                   % h0 = heave amplitude

%% solve for L
theta = atan((h2-h1)/30);   % theta = pitch angle
for idx = drange(1:63) 
    if theta(idx) == 0
    L = 205-h1 %output
               % L = distance from poles to center of system (when foil is parallel)
end
    
%% solve for theta0
A = (2*h1+h2)/3;    % A = average point btwn bars
Aprime = (2*r*cos(alpha1)-2*r*sin(alpha1)-r*cos(2*pi-alpha1-phi0)+r*sin(2*pi-alpha1-phi0))/3;  % Aprime = derivative of A
if Aprime == 0
    theta0 = atan((h2-h1)/30) %output
                              % theta0 = maximum pitch angle (at centerpoint)
end 
end

%% variable explanations
% r = radius of wheel
% d = distance from center of wheel to pole
% m = # divet on the pole (from inside out)
% phi0 = phase difference at start
% phi = phase difference at any point
% alpha1 = angle position of first wheel at start
% alpha2 = angle position of second wheel at start
% A = average point btwn bars
% Aprime = derivative of A
% theta = pitch angle
% theta0 = maximum pitch angle (at centerpoint) 
% h1 = distance of first pole at any point
% h2 = distance of second pole at any point
% h0 = heave amplitude
% L = distance from poles to center of system (when foil is parallel)
