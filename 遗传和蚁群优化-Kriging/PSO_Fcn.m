function Pop = PSO_Fcn(Pop)
NumofParticles = size(Pop,1);
NPar = size(Pop,2); % Number of Optimization Parameters

GlobalBestP = Pop(1,:); % Global Best Position
% GlobalBestC = feval(ff,GlobalBestP); % Global Best Cost

C1 = 1.5;
C2 = 4 - C1;

for i = 1:NumofParticles
    r1 = rand(1,NPar);
    r2 = rand(1,NPar);
    w = rand(1,NPar);
    Velocity = r2*C2.*(GlobalBestP - Pop(i,:));
    Pop(i,:) = Pop(i,:) + Velocity;
end