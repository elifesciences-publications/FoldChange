function [ y0 ] = initial_conditions( K )

K = 10.^(K);

%
% Rates
%

% receptor degradation 
kdeg  = K(11); % Both rates same 
% receptor internalization
ki    = K(13);
% receptor recycling
krec  = K(15);


%
% Initial conditions
%

% ligand free receptors, plasma membrane
c20  = K(4);
% ligand free receptors, endosomes 
c30  = ki/(kdeg + krec)*c20;
% ligand bound monomer receptors, plasma membrane
c40  = 0;
% one ligand bound dimers, plasma membrane
c50  = 0;
% one ligand bound dimers, endosome
c60  = 0;
% two ligand bound dimers, plasma membrane
c70  = 0;
% two ligand bound dimers, endosomes
c80  = 0;
% one ligand bound phosphorylated dimers, plasma membrane
c90  = 0;
% one ligand bound phosphorylated dimers, endosome
c100 = 0 ; 
% two ligand bound phosphorylated dimers, plasma membrane
c110 = 0;
% two ligand bound phosphorylated dimers, endosome
c120 = 0;
% pip2
c130 = K(2);
% pip3
c140 = 0;
% free pdk1
c150 = K(3);
% pip3-pdk1
c160 = 0;
% free akt
c170 = K(1);
% pip3-pdk1-akt
c180 = 0;
% pakt
c190 = 0;
% one ligand bound monomer, endosome
c200 = 0;
y0 = [c20;c30;c40;c50;c60;c70;c80;c90;c100;c110;c120;c130;c140;c150;c160;c170;c180;c190;c200];






end

