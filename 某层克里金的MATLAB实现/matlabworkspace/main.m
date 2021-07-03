function main()
load('zkdata.mat', 'zk');
load('zkheight.mat');
theta = [20 20]; lob = [1e-3 1e-3]; upb = [50 50];
[dmodel, perf] = dacefit(zk, fsy, @regpoly1, @corrspline, theta, lob, upb);%���캯��ģ��Ϊ��˹ģ��,zk�洢�˵�λ����ֵ��fsyΪ�۲�ֵ
X = gridsamp([0 0;4600 5500], 120);     
[YX_a,MSE] = predictor(X, dmodel);    
X1 = reshape(X(:,1),120,120); 
X2 = reshape(X(:,2),120,120);
YX = reshape(YX_a, size(X1));
figure(1), mesh(X1, X2, YX);         %����Ԥ�����
hold on,
plot3(zk(:,1),zk(:,2),fsy,'.k', 'MarkerSize',15)    %����ԭʼɢ������
hold off;
figure(2),mesh(X1, X2, reshape(MSE,size(X1)));  %����ÿ����Ĳ�ֵ����С
end