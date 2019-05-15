function [ flg ] = model_constraints( K )


K = 10.^(K);
R = K(4);


% receptor degradation 
kdeg  = K(11); 
% receptor internalization
ki    = K(13);
% receptor recycling
krec  = K(15);

Ri  = ki/(kdeg + krec)*R;
flg1 = 0;
flg2 = 0;

Rt = R + Ri;
if Rt > 1e5 && Rt < 1e6
    flg1 = 1;
end

kD = K(6)/K(5);  % Constraint on kD
if kD > 10 && kD < 200
	flg2 = 1;
end
%
flg = flg1*flg2;



end

