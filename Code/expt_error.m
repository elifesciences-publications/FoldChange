function [ erx ] = expt_error( ppakt,psegfr,mpakt,spakt,msegfr,ssegfr )

%
% Evaluates error based on likelihood of the data
%
% 
% [a b] = size(ppakt);
%ppakt = reshape(ppakt,a*b,1);
%mpakt = reshape(mpakt,a*b,1);
%spakt = reshape(spakt,a*b,1);
% 
% ppakt = mlefit(ppakt,mpakt,spakt);       % mle fit with sigmas
%ppakt = mlefit(ppakt,mpakt,ones(a*b,1)); % mle fit without sigmas
%mpakt = reshape(mpakt,a,b);
%spakt = reshape(spakt,a,b);
%ppakt = reshape(ppakt,a,b);

ppakt = ppakt/ppakt(1,5);% Normalize by the maximum NOT MLE

e1 = (ppakt-mpakt)./spakt;e1 = e1.*e1/2;e1 = sum(sum(e1));

[a b] = size(psegfr);
psegfr = reshape(psegfr,a*b,1);
msegfr = reshape(msegfr,a*b,1);
ssegfr = reshape(ssegfr,a*b,1);


psegfr = mlefit(psegfr,msegfr,ssegfr);       % mle fit with sigmas
%psegfr = mlefit(psegfr,msegfr,ones(a*b,1));   % mle fit without sigmas

e2 = (psegfr-msegfr)./ssegfr;e2 = e2.*e2/2;e2 = sum(e2);

erx = e1 + e2;



end

