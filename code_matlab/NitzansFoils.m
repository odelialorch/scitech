clear all;
close all;
clc;
m_n = 0; % Foil distance displacement in number of pins
m_pin = 0.5; % Distance between two pins in meters
m = m_n * m_pin; % Foil distance displacement in meters
phi = pi / 2; % Phase difference between the two wheels in rad
r = 0.106; % Radius of circle (distance from center to pin) in m
barDistance = 0.5; % Distance between the two parallel bars in m

a1 = linspace(0, 4 * pi); % Angle of first motor in rad
a2 = a1 + phi; % Angle of second motor in rad

offset1 = r * (1 - cos(a1)); % Offset of the SLOT position between the starting position and the current position
l1 = offset1 / sin(pi / 4); % Offset of the BAR position between the starting position and the current position

offset2 = r * (1 - cos(a2)); % Offset of the SLOT position between the starting position and the current position
l2 = offset2 / sin(pi / 4); % Offset of the BAR position between the starting position and the current position

l = m + (l1 + l2) / 2; % Average of the offsets between the two bars
theta = atan((l1 - l2) / barDistance);

maxl = sqrt(2) * r * (1 + cos(phi / 2)) + m;
minl = sqrt(2) * r * (1 - cos(phi / 2)) + m;

h0 = sqrt(2) * r * cos(phi / 2);

hold on
plot(a1, l);
plot(a1, ones(size(a1)) * (h0 + minl));