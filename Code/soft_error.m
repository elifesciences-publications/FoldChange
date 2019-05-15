function [ erx ] = soft_error( sols,doses )

erx = 0;
%
ix = find(doses==3.16);
yy = sols{ix};
akt0    = yy(1,16);
pakt    = yy(:,18); %pAkt
paktmax = max(pakt);
tAkt = (paktmax/akt0);
%
if tAkt < 0.1
    trm = (tAkt-0.1);trm = trm*trm/(2*0.004*0.004);
    erx = trm;
end
%
end


