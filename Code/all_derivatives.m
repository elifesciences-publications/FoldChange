function [ dy ] = all_derivatives( t,y,K )

K = 10.^(K);

%
% First rates
%

% ligand binding to receptors
k1    = K(5);
% ligand unbinding from receptor
kn1   = K(6);
% receptor dimerization
k2    = K(7);
% receptor undimerization
kn2   = K(8);
% receptor phosphorylation
kp    = K(9);
% receptor dephosphorylation
kdp   = K(10);
% receptor degradation
kdeg  = K(11); %both rates equal 
% phosphorylated receptor degradation
kdegs = K(12);
% receptor internalization
ki    = K(13);
% phosphorylated receptor internalization
kis   = K(14);
% receptor recycling
krec  = K(15);
% phosphorylated receptor recycling
krecs = K(16);
% phosphorylated receptor activating pip2
k3    = K(17);
% dephosphorylation of pip3
kn3   = K(18);
% pdk1 binding to pip3
k4    = K(19);
% pdk1 unbinding from pip3
kn4   = K(20);
% pip3-pdk1 binding to Akt
k5    = K(21);
% pip3-pdk1-akt complex dissociation
kn5   = K(22);
% kcat of akt phosphorylation
k6    = K(23);
% kcat of akt dephosphorylation
kn6   = K(24);

%
% Now concentrations
%

% ligand concentration
c1    = K(25);
% ligand free receptors, plasma membrane
c2    = y(1);
% ligand free receptors, endosomes 
c3    = y(2);
% ligand bound monomer receptors, plasma membrane
c4    = y(3);
% one ligand bound dimers, plasma membrane
c5    = y(4);
% one ligand bound dimers, endosome
c6    = y(5);
% two ligand bound dimers, plasma membrane
c7    = y(6);
% two ligand bound dimers, endosomes
c8    = y(7);
% one ligand bound phosphorylated dimers, plasma membrane
c9    = y(8);
% one ligand bound phosphorylated dimers, endosome
c10   = y(9);
% two ligand bound phosphorylated dimers, plasma membrane
c11   = y(10);
% two ligand bound phosphorylated dimers, endosome
c12   = y(11);
% pip2
c13   = y(12);
% pip3
c14   = y(13);
% free pdk1
c15   = y(14);
% pip3-pdk1
c16   = y(15);
% free akt
c17   = y(16);
% pip3-pdk1-akt
c18   = y(17);
% pakt
c19   = y(18);
% one ligand bound monomer, endosome
c20   = y(19);

% Now derivatives
%
%
R0 = K(4);
kprod = R0*kdeg*ki/(kdeg + krec);
%
% ligand free receptors, plasma membrane
dc2  = kprod - ki*c2 + kn2*c5 + krec*c3 + kn1*c4 - k2*c2*c4 - k1*c1*c2;
% ligand free receptors, endosomes 
dc3  = ki*c2 - kdeg*c3 - krec*c3;
% ligand bound monomer receptors, plasma membrane
dc4  = kn2*c5 + 2*kn2*c7 - kn1*c4 - 2*k2*c4*c4 - k2*c2*c4 + k1*c1*c2 - ki*c4 + krec*c20;
% one ligand bound dimers, plasma membrane
dc5  = krec*c6 - kn2*c5 - kp*c5 - ki*c5 + kdp*c9 + kn1*c7 + k2*c2*c4 - k1*c1*c5;
% one ligand bound dimers, endosome
dc6  = ki*c5 - kdeg*c6 - krec*c6 + kdp*c10 - kp*c6;
% two ligand bound dimers, plasma membrane
dc7  = krec*c8 - kn2*c7 - kp*c7 - ki*c7 + kdp*c11 - kn1*c7 + k2*c4*c4 + k1*c1*c5;
% two ligand bound dimers, endosomes
dc8  = ki*c7 - kdeg*c8 - krec*c8 + kdp*c12 - kp*c8;
% one ligand bound phosphorylated dimers, plasma membrane
dc9  = kp*c5 - kis*c9 + krecs*c10 - kdp*c9 + kn1*c11 - k1*c1*c9;
% one ligand bound phosphorylated dimers, endosome
dc10 = kis*c9 - kdegs*c10 - krecs*c10 - kdp*c10 + kp*c6;
% two ligand bound phosphorylated dimers, plasma membrane
dc11 = kp*c7 - kis*c11 + krecs*c12 - kdp*c11 - kn1*c11 + k1*c1*c9;
% two ligand bound phosphorylated dimers, endosome
dc12 = kis*c11 - krecs*c12 - kdp*c12 - kdegs*c12 + kp*c8;
% pip2
dc13 = kn3*c14 - k3*c9*c13 - k3*c11*c13;
% pip3
dc14 = kn4*c16 - kn3*c14 - k4*c14*c15 + k3*c9*c13 + k3*c11*c13;
% free pdk1
dc15 = kn4*c16 - k4*c14*c15;
% pip3-pdk1
dc16 = kn5*c18 + k6*c18 - kn4*c16 - k5*c16*c17 + k4*c14*c15;
% free akt
dc17 = kn6*c19 + kn5*c18 - k5*c16*c17;
% pip3-pdk1-akt
dc18 = k5*c16*c17 - k6*c18 - kn5*c18;
% pakt
dc19 = k6*c18 - kn6*c19;
% ligand bound receptor monomer, endosome
dc20 = ki*c4 - krec*c20 - kdeg*c20;
dy = [dc2;dc3;dc4;dc5;dc6;dc7;dc8;dc9;dc10;dc11;dc12;dc13;dc14;dc15;dc16;dc17;dc18;dc19;dc20];
end

