function [ dat ] = mlefit( ppakt,pAkt,pAkt_sigmas )


f1 = ppakt./pAkt_sigmas;f1 = f1.*f1;f1 = sum(f1);
f2 = ppakt./(pAkt_sigmas.*pAkt_sigmas);f2 = sum(f2);
f3 = (pAkt.*ppakt)./(pAkt_sigmas.*pAkt_sigmas);f3 = sum(f3);
f4 = (ppakt)./(pAkt_sigmas.*pAkt_sigmas);f4 = sum(f4);
f5 = 1./(pAkt_sigmas.*pAkt_sigmas);f5 = sum(f5);
f6 = (pAkt)./(pAkt_sigmas.*pAkt_sigmas);f6 = sum(f6);
m  = -(f3*f5-f2*f6)/(f2*f4-f1*f5);c = -(f1*f6-f3*f4)/(f2*f4-f1*f5);
dat = ppakt*m + c;

end

