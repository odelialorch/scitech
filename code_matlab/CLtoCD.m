
function [CDout] = CLtoCD(alphaIn, CLin)
load alphacdcl
CLoverCD = CL./CD;
result = interp1(alpha1,CLoverCD, alphaIn);
CDout = CLin / result;
end