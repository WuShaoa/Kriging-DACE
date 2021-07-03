load('zkdata.mat');
[dmodel, perf] = dacefit(zk, fsy, @regpoly0, @corrgauss, theta, lob, upb);%���캯��ģ��Ϊ��˹ģ��,zk�洢�˵�λ����ֵ��fsyΪ�۲�ֵ
X = gridsamp([0 0;4600 5500], 100);     
[YX,MSE] = predictor(X, dmodel);    
X1 = reshape(X(:,1),100,100); 
X2 = reshape(X(:,2),100,100);
YX = reshape(YX, size(X1));
figure(1), mesh(X1, X2, YX);         %����Ԥ�����
hold on,
plot3(zk(:,1),zk(:,2),fsy,'.k', 'MarkerSize',25)    %����ԭʼɢ������
hold off;
figure(2),mesh(X1, X2, reshape(MSE,size(X1)));  %����ÿ����Ĳ�ֵ����С