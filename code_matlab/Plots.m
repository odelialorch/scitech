close all
hold on
strouhals = [0.1 0.3 0.5 0.7 0.908];
%lines = ['-^' '-s' '-d' '-v' '-h'];
for i = strouhals
[t, theta, flowAngle, hDot, alpha] = Oscillations(i);
plot(t, rad2deg(alpha), '-r');
disp(alpha(1));
%plot(t, rad2deg(theta), '--b');
%plot(t, rad2deg(-flowAngle), '-g');
end