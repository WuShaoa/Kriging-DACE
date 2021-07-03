function [Off1 , Off2] = CrossOver_fcn(Par1,Par2)
Beta1 = rand(1,numel(Par1));
Beta2 = rand(1,numel(Par1));

Off1 = Beta1 .* Par1 + (1-Beta1) .* Par2;
Off2 = Beta2 .* Par1 + (1-Beta2) .* Par2;
end