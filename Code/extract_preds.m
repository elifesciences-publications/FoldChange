function [ sEGFR pAkt ] = extract_preds( yy, tEGFR, tpAkt )

% EGFR
y1 = yy(tEGFR+1,1); % free receptor
y3 = yy(tEGFR+1,3); % ligand bound monomer
y4 = yy(tEGFR+1,4); % 1 ligand bound dimer
y6 = yy(tEGFR+1,6); % 1 ligand bound phosphorylated dimer
y8 = yy(tEGFR+1,8); % 2 ligand bound dimer
y10 = yy(tEGFR+1,10); % 2 ligand bound phosphorylated dimer
sEGFR = y1 + y3 + 2*(y4 + y6 + y8 + y10);

% pAkt
pAkt = yy(tpAkt+1,18);


end

