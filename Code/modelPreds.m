function [ yy ] = modelPreds( K,doses,tms )

Ktrial = K;
nDose  = length(doses);
nTime = length(tms); 
yy = {};
%
options = odeset('RelTol',1e-5);
for doseI = 1:nDose
    Ktrial(25) = doses(doseI); % Hard coding the ligand dose variable number
    y0         = initial_conditions(Ktrial);
    [t y]      = ode15s(@all_derivatives,tms,y0,options,Ktrial);
    yy{doseI} = y;
end


