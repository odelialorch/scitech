 % function [ClReal, t] = lift(h0,alphaMax) %defining the function with inputs,outputs
close all; clear all;
 
alphaMax = deg2rad(15);

%% constants
h0 = 100; %mm
ro = 0.001; %kg/mm^3
A = 2*h0;%width of jet stream, mm
S = 60000;  %surface area of the wing (600*100)
a = 1/3; %number of semichords relative to the pitch axis (1/3 of foil length) and mid chord (1/2 of the foil)
b = h0/2;  %mm
f = 1/2.5; %Hz, 1/s
St = 0.2;   %Strouhal number (dimensionless)
theta0 = atan(St*pi)- alphaMax;
V = f*A/St; %mm/sec
t = linspace(0,2/f);  %sec
Ck = theodorsen(f,V,b);
%% theta (alpha) equations -- pitching
w = 2*pi*f; % converting f to w
phi = pi/2; % phase between heaving and pitching, constant
theta = theta0*sin(w*t + phi);  % equation for theta
dtheta = w*theta0*cos(w*t + phi); % first derivative of theta
d2theta = -w^(2)*theta0*sin(w*t + phi); % second derivative of theta
%% h equations -- heaving
h = h0*sin(w*t);  % equation for h (not used in Theodorsen)
dh = w*h0*cos(w*t); % first derivative of h
d2h = -w^(2)*h0*sin(w*t); % second derivative of h

%%
B = atan(dh/V);
%% Final Theodorsen Equation

Cl1 = pi*b*((dtheta/V)+(d2h/V^2)-(b*a*d2theta/V^2));
Cl2 = 2*pi*Ck*((dh/V) + theta + (b*(0.5 - a)*(dtheta/V)));
Cl = Cl1 + Cl2;
ClReal = real(Cl);

%% AoA (angle of attack)

AoA = - theta + B;
%% Forces

Ct = Cl.*sin(B)
T = real(Ct.*0.5*ro*(V^2)*S);
L = real(Cl.*0.5*ro*(V^2)*S);

%% graph replication

subplot(4,1,1)
plot(t,theta,'g')
hold on
plot(t, h/100, 'b')
legend('Pitching','Heaving')
grid on;
hold off

subplot(4,1,2)
plot(t,rad2deg(AoA) ,'b')
grid on
legend('AoA')
hold off

subplot(4,1,3)
plot(t, L/1000, 'r')
hold on
plot(t, T/1000, 'b')
grid on
legend('Y Force','X Force')
hold off
% end