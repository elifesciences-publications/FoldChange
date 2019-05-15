function [ Kf Ef alphaf ] = run_walk( K0,E0,lP,uP,nIter,Temp,sysargs,alpha0 )

rand('state',sum(100.*clock))

%
% This script will run the simulated annealing walk
%
alpha = alpha0;



% Load stuff needed for simulations
doses  = sysargs{1};
tms    = sysargs{2};
mpakt  = sysargs{3};
spakt  = sysargs{4};
msegfr = sysargs{5};
ssegfr = sysargs{6};
% Initialize vectors
ErArr = [];
KOld  = K0;KNew = K0;
EOld  = E0;ENew = E0;
nPar  = length(K0);
dP    = uP-lP;
acpt  = 0;
iter  = 1;
e1O = 10;
while iter < nIter+1
    if mod(iter,50) == 0
        [iter/nIter acpt/iter EOld/1000 e1O/1000 alpha]
        if acpt/iter > 0.4
            alpha = alpha*1.05;
        else
            alpha = alpha*0.95;
        end
        if alpha > 0.25
            alpha = 0.25;
        end
        if alpha < 0.0025
            alpha = 0.0025;
        end
    end
    ind     = 1 + floor(3*rand);
    inds    = randsample(nPar,ind);
    rndarr  = zeros(nPar,1);rndarr(inds) = 1;
    KNew = KOld;
    KNew = alpha.*(randn(nPar,1)).*dP + KNew;
    if min(KNew - lP) > -1e-10 && min(uP - KNew) > -1e-10 && model_constraints(KNew) % parameters are in line
        ErArr(iter) = EOld;
        Ks{iter}    = KOld;
        alphs(iter) = alpha;
        iter = iter + 1; 
        [e1 e2] = eval_error_param_point(KNew,doses,tms,mpakt,spakt,msegfr,ssegfr);
        ENew = e1 + e2;
        if exp(-(ENew-EOld)/Temp) > rand
            KOld = KNew;
            e1O  = e1;
            EOld = ENew;
            acpt = acpt + 1;
        end
        
    end
end
%
%ErArr
ii = find(ErArr == min(ErArr));ii = ii(end);
Kf = Ks{ii};Ef = ErArr(ii);alphaf = alpha;
%Kf = Ks{end};Ef = ErArr(end);alphaf = alpha;


end

