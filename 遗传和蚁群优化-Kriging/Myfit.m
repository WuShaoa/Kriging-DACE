function f = Myfit(x)

% �������ܣ�����ø����Ӧ��Ӧ��ֵ
% x           input     ����
% fitness     output    ������Ӧ��ֵ

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
