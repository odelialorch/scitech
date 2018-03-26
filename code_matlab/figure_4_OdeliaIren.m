clc
clear all
close all
Re=4*10^4; %Reynold number
U=0.4; %Uniform flow velocity m/s
phi=pi/2; %phase
c=0.1; %chord length
h0=0.5; %amplitude of heave
alphaMax=pi/12;

% St=[0.10, 0.30, 0.50, 0.70, 0.908]'; %strouhal numbers
% w=St*U/(4*pi*h0); %omega, angular freq
% T=((2*pi)/w); %period
% tT=linspace(0,1,14)'; %x-axis
% t=(tT.*T); %time

St=0.908; %strouhal numbers
w=St*U/(4*pi*h0); %omega, angular freq
theta0=alphaMax+atan(h0*w/U);
T=((2*pi)/w); %period
t=linspace(0,T,100)'; %time
tT=t/T;
%% functions

h=h0*sin(w*t); %heave
theta=theta0*sin(w*t+phi); %pitch
hdot=h0*cos(w*t)*w;
alpha=-atan(hdot/U)+theta; %angle of attack
plot(tT, rad2deg(alpha));