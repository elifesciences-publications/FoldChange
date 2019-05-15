function [ e1 e2 ] = eval_error_param_point( K,doses,tms,mpakt,spakt,msegfr,ssegfr )

%
%doses = [-10 -1.5 -1 -0.5 0 0.5 1.5 2];
%tms   = 60*[0:180];
%
yy = modelPreds(K,doses,tms);
%
[psegfr ppakt] = extract_preds_doses(yy);

e1 = expt_error(ppakt,psegfr,mpakt,spakt,msegfr,ssegfr);
e2 = soft_error(yy,[0 0.03 0.1 0.31 1 3.16]); % hard coded

erx = e1 + e2;



end

