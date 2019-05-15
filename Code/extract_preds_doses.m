function [ sePred paPred ] = extract_preds_doses( sols )


paPred = [];
sePred = [];

% 
tEGFR = [150 180];
tpAkt = [5 10 15 30 45 90 180];
%

for i=1:6
    [s p] = extract_preds(sols{i},tEGFR,tpAkt);
    sePred = [sePred s];
    paPred = [paPred p];
end
%
paPred = paPred(:,2:end);
sePred = sePred';



end

