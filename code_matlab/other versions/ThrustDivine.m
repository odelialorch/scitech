close all
%function [Ct, Cn, alpha, t, T] = ThrustBetter(a, b, alpha0, h0)
a = 1;
b = 50;
alpha0 = deg2rad(15);
h0 = 100;
% Ct = constant of thrust
% a = # of semi-chords the foil is from the mid-chord (measure of distance)
% b = length of semi-chord 
% theta0 = max pitch angle (at centerpoint)
% h0 = heave amplitude

%% Constants
St = 0.2; % St = Strouhal number
U = 400;%f * 2 * h0 / St; % U = velocity of uniform flow (water)
f = U * St / (2*h0); % f = circular frequency
offset = 1.65;
t = linspace(offset, 2/f + offset); % t = time
T = 1/f;
x = t - offset;
x = x / T;
w = 2*pi * f; % Angular velocity = circle * circular freq
phi = pi / 2; % Phase difference between heave and pitch
theta0 = atan(St * pi) - alpha0;        

%% Variables Dependent on Inputs

h = h0 * sin(w*t);
dh = h0 * w * cos(w*t); %dh = derivative of h = heave velocity
theta = theta0 * sin(w*t + phi); % theta = pitch angle at any time
beta = atan(dh/U); % beta = angle of relative flow
alpha = -theta + beta; % alpha = angle of attack

%% Constant of Thrust Equation, in terms of Cl and Cd
Cl = LiftDivine(a, b, theta0, h0, f, St, t); % Cl = coefficient of lift
Cl = real(Cl);
Cd = 0;%DragBetter(alpha, Cl); % Cd = coefficient of drag
Ct = Cl.*sin(beta);%-Cd.*cos(beta);
Cn = Cl.*cos(beta)+Cd.*sin(beta);

Cn = -Cn;

% subplot(3,1,1);
% plot(x, h/100, 'LineWidth', 2)
% title('Heave and Pitch');
% hold on
% grid on
% plot(x, theta)
% hold off
% 
% subplot(3,1,2);
% plot(x, rad2deg(alpha));
% title('Angle of Attack');
% grid on


% subplot(3,1,3);
% plot(x, Cn);
figure();
plot(x, Ct, 'LineWidth', 2);
hold on
plot(x, Cl, 'g', 'LineWidth', 2);
%title('Forces');
legend('Ct','Cl')
ylabel('Cl or Ct')
xlabel('t/T')
ax = gca;
ax.XAxisLocation = 'origin';
xlabh = get(gca,'XLabel');
set(xlabh,'Position',get(xlabh,'Position') - [0 3.4 0]);
grid on


figure();

yyaxis right
ax = gca;
ax.YColor = 'black';
ax.XAxisLocation = 'origin';
hLine = plot(x, h, 'k', 'LineWidth', 2);
xlabel('t/T');
xlabh = get(gca,'XLabel');
set(xlabh,'Position',get(xlabh,'Position') - [0 20 0]);
ylabel('Position [mm]');

yyaxis left
ax = gca;
ax.YColor = 'black';
aLine = plot(x, rad2deg(alpha),'Color', [1 129/255 0], 'LineWidth', 2);
hold on
tLine = plot(x, rad2deg(theta), 'k--', 'LineWidth', 2);
ylabel('Angle [deg]');

legend([hLine, tLine, aLine], 'Heave', 'Pitch', 'AoA');
grid on