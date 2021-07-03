%% Start of the program.
clc
clear
close all
%% Problem Statement (Traveling Sealsman Problem)
NPar = 3; % Number of Optimization Parameters
VarLow =[37 61 10]; % Lower Limmit of problem
VarHigh =[41 65 14]; % Upper Limmit of problem
FunName = 'Myfit';
%% Algoritm Parameters
PopSize = 200;
ChromLenght = NPar;
MaxIterations = 50;
KeepPercent = 50/100;
CrossPercent = 70/100;
MutatPercent = 1 - KeepPercent - CrossPercent;
SelectionMode = 1;

KeepNum = round(KeepPercent * PopSize);
%CrossNum = round(CrossPercent * PopSize);
CrossNum=3;
if mod(CrossNum,2) ~= 0
    CrossNum = CrossNum + 1;
end
MutatNum = PopSize - KeepNum - CrossNum;

%% Initial Population
AA=rand(PopSize,NPar);
AB=VarHigh - VarLow;
ABC=[];
for i=1:3,C=AA(:,i)*AB(:,i)+VarLow(1,i),ABC=[ABC C],end;
Pop = ABC
clear AA AB ABC C;
Cost = feval(FunName,Pop);
[Cost Indx] = sort(Cost);
Pop = Pop(Indx,:);

%% MAIN LOOP
MinMat = [];
MeanMat = [];

for Iter = 1:MaxIterations
    %% Select Keep
    Pop(1:KeepNum,:) = PSO_Fcn(Pop(1:KeepNum,:));
    %% CrossOver
    SlectedIndexes = SelectParents_Fcn(Cost,CrossNum,SelectionMode);
    CrossPop = [];
    for ii = 1:2:CrossNum
        Par1Index = SlectedIndexes(ii);
        Par2Index = SlectedIndexes(ii+1);        
        Par1 = Pop(Par1Index,:);
        Par2 = Pop(Par2Index,:);        
        [Off1 , Off2] = CrossOver_fcn(Par1,Par2);
        CrossPop = [CrossPop ; Off1 ; Off2];
    end
    
    Pop(KeepNum+1:KeepNum+CrossNum,:) = CrossPop;
    %% Mutation
    AA=rand(MutatNum,NPar)
    AB=VarHigh - VarLow;
    ABC=[];
    for i=1:3,C=AA(:,i)*AB(:,i)+VarLow(1,i),ABC=[ABC C],end;
    Pop(KeepNum+CrossNum+1 : end , :)= ABC;
    clear AA AB ABC;
    [m,n] = size(Pop)
    %% NewPopulation
    for i=1:n
        jj=1;
      while jj<=m
          if  Pop(jj,i)>VarHigh(1,i),Pop(jj,i)=VarHigh(1,i),end;
          if  Pop(jj,i)<VarLow(1,i),Pop(jj,i)=VarLow(1,i),end;
          jj=jj+1;
      end;
    end;     
    Cost = feval(FunName,Pop);
    
    [Cost Indx] = sort(Cost);
    Pop = Pop(Indx,:);
    
    MinMat = [MinMat min(Cost)];
    MeanMat = [MeanMat mean(Cost)];
    
    %% Display    
    plot(MinMat,'r','Linewidth',2.5);
    xlabel('Iterations')
    ylabel('Cost')
    hold on
    plot(MeanMat,'b:','Linewidth',2);
    hold off
    xlim([1 MaxIterations])
    pause(0.05)
    
end
%% Final Result Display
BestSolution = Pop(1,:)
BestCost = Cost(1)
fval=BestCost;