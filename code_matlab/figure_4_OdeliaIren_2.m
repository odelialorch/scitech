clc
clear all
close all
%% constants
Re=4e4;
U=0.4;
c=0.1;
h0=0.75*c;
phi=pi/2;
alphaMax=pi/12; %=15deg
St=[0.1 0.3 0.5 0.7 0.908];

%% loop
for i=1:5
    %St(i)
    w=U*St(i)/(4*pi*h0);
    T=2*pi/w;
    t=linspace(0,T,200);
    tT=t/T;
    theta0=rad2deg(alphaMax)+atan(h0*w/U);
    theta=deg2rad(theta0)*sin(w*t+phi);
    % h=h0*sin(w*t);
    hdot=h0*cos(w*t)*w;
    %alpha=-St(i)/(4*pi)+alphaMax+pi*St(i);
    alpha=theta-atan(hdot/U);
    subplot(2,2,1)
    plot(tT, rad2deg(alpha));
    title('alpha');
    hold on
    subplot(2,2,2);
    plot(tT, rad2deg(-atan(hdot/U)));
    title('atan');
    hold on
    subplot(2,2,3);
    plot(tT, rad2deg(theta));
    title('theta');
    hold on
    subplot(2,2,4);
    plot(tT, hdot);
    title('hdot')
    hold on
end
hold off
