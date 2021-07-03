function f = Myfit(x)

% 函数功能：计算该个体对应适应度值
% x           input     个体
% fitness     output    个体适应度值

%output=predictor(Input',dmodel);
load fengji03
theta = [10 10 10]; lob = [1e-1 1e-1 1e-1]; upb = [20 20 20];
;
S=S';
Y=Y';
[dmodel, perf] = ...
dacefit(S,Y, @regpoly0, @corrgauss, theta, lob, upb)

f=predictor(x,dmodel);
end
