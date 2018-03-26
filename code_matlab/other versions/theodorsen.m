function [Ck] = theodorsen(f,V,b)

    %f = frequency of oscillation, Hertz
    %V = flow velocity, milimeters/seconds
    %b = 30; %semi-chord length, milimeters
    
    w = f*2*pi; %angular velocity, radians/seconds
    k = w*b/V;  %reduced frequency
    
    Y0 = bessely(0,k);
    J0 = besselj(0,k);
    Y1 = bessely(1,k); 
    J1 = besselj(1,k); 

    F = (J1*(J1 + Y0) + Y1*(Y1 - J0))/((J1 + Y0)^2 + (J0 - Y1)^2);%equation that yields real results
    G = -(Y1*Y0 + J1*J0)/((J1 + Y0)^2 + (J0 - Y1)^2); %equation that yields imaginary results

    Ck = F+1i*G; %equation for Ck, Theodorsen's function
end
