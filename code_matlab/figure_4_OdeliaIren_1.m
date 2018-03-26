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

% %% loop
% St=[0.1 0.3 0.5 0.7 0.908];
% for i=1:5
%     %St(i)
%     w=U*St(i)/(4*pi*h0);
%     T=2*pi/w;
%     t=linspace(0,T,200);
%     tT=t/T;
%     theta0=alphaMax+atan(h0*w/U);
%     theta=theta0*sin(w*t+phi);
%     % h=h0*sin(w*t);
%     hdot=h0*cos(w*t)*w;
%     alpha=-atan(hdot/U)+theta;
%     subplot(4,1,1);
%     plot(tT, rad2deg(alpha));
%     title('alpha');
%     subplot(4,1,2);
%     plot(tT, rad2deg(theta0*sin(w*t+phi)));
%     title('sin');
%     subplot(4,1,3);
%     plot(tT,rad2deg(hdot));
%     title('hdot');
%     subplot(4,1,4);
% %     plot(St,w);
% %     title('w');
%     hold on
% end
% hold off
%%
St=[0.1 0.3 0.5 0.7 0.908];
for i=1:5
    w=U*St(i)/(4*pi*h0);
    T=2*pi/w;
    t=linspace(0,30,300);
    tT=t/T;
    theta0=alphaMax+atan(h0*w/U);
    theta=theta0*sin(w*t+phi);
    hdot=h0*cos(w*t)*w;
    alpha=-atan(hdot/U)+theta;
%     subplot(4,1,1);
%     plot(tT, rad2deg(-atan(hdot/U)));
%     title('atan');
%     subplot(4,1,2);
%     plot(tT, rad2deg(theta0*sin(w*t+phi)));
%     title('sin (theta)');
%     subplot(4,1,3);
    plot(t, rad2deg(alpha));
    title('alpha');
    hold on
end
%% vector
% St=[0.1 0.3 0.5 0.7 0.908];
% w=U*St/(4*pi*h0);
% T=2*pi./w;
% t=linspace(0,1,5);
% tT=t./T;
% theta0=alphaMax+atan(h0*w/U);
% theta=theta0.*sin(w.*t+phi);
% % h=h0*sin(w*t);
% hdot=h0.*cos(w.*t).*w;
% alpha=-atan(hdot/U)+theta;
% subplot(1,2,1);
% plot(tT, rad2deg(alpha));
% subplot(1,2,2);
% plot(tT, rad2deg(theta));
% hold on
