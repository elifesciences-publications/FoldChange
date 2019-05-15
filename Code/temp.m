clc
clear
rand('state',sum(100.*clock))
%
load ../params_initial.dat
load ../expt_data
%
nK = length(params_initial);
lK = params_initial(:,1);
uK = params_initial(:,2);
%
doses      = [-10 -1.5 -1 -0.5 0 0.5];
tms        = 60*(0:180);
sysargs{1} = doses;
sysargs{2} = tms;
sysargs{3} = mpakt;
sysargs{4} = spakt;
sysargs{5} = msegfr;
sysargs{6} = ssegfr;
%
flg = 0;
while flg < 1
	Kt = lK + rand(nK,1).*(uK-lK);
	if min(Kt - lK) > -1e-10 && min(uK - Kt) > -1e-10 && model_constraints(Kt)
	   flg = 1;
	   Et = 1e10;
	end
end
'found initial parameters'
[min(Kt-lK) min(uK-Kt)]
load ../data_1.mat
Kt
