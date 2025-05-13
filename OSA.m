%% Owl Search Algorithm (OSA) in MATLAB
% Developed by: Ali Sam Daliri
% Email: alisamdaliri@outlook.com
% GitHub: https://github.com/SINASAM02
% 
% Date: 2025/11/05
%
% For academic use, feel free to cite or modify;)
%% Program Start
clc;
clear;
close all;
%% Problem Definition
nvar = 5; % Number Of Decision Variable
varmin = -10; % Lower Bond Of Decision varible
varmax = +10; % Upper Bond Of Decision varible
costfunction = @(x)     sphere(x); % Cost Function 
%% OSA Parameters
npop = 50;  % Number Of Papulatin 
maxiteration = 1000; % Maximum Of Iteration 
beta = 1.9 ;
%% Initialization Step
empty_owl.position = [];
empty_owl.cost = [];
empty_owl.intensity = [];
empty_owl.ic  = [];
empty_owl.r = [];
owl = repmat(empty_owl,npop,1);
bestsol.cost = inf;
weaksol.cost = 0;
for i = 1:npop
    owl(i).position = unifrnd(varmin,varmax,1,nvar);
    owl(i).cost = costfunction(owl(i).position);
    if owl(i).cost < bestsol.cost 
        bestsol = owl(i);
    end
    if owl(i).cost > weaksol.cost
        weaksol = owl(i);
    end
end
%% Main Loop 
bestcost = zeros(maxiteration,1);
for iter = 1:maxiteration
    pvm = rand();
    beta = 1.9 - 1.9 * ((iter) / maxiteration);
    % Select Best Owl
    bestowl = bestsol;
    % Select Weak Owl
    weakowl = weaksol;
    % OWL Phase
    for i = 1:npop
        alpha = rand() * 0.5; % Defined Value For Alpha
        % Optimized value For Alpha
        % alpha = rand() * 0.2; 
        % alpha = 0;
        % Nomalized Intensity Calculation
        owl(i).intensity = (owl(i).cost - bestowl.cost)/(weakowl.cost - bestowl.cost);
        % Distance Calculation
        owl(i).r = norm(owl(i).position - bestowl.position);
        % Update intensity 
        owl(i).ic = (owl(i).intensity / (owl(i).r^2 + eps)) + rand();
        % Update Owl Position
        if pvm < 0.5
            newsol.position = owl(i).position + beta * owl(i).ic * abs(alpha * bestowl.position - owl(i).position);
        else
            newsol.position = owl(i).position - beta * owl(i).ic * abs(alpha * bestowl.position - owl(i).position);
        end
        % Bounded New Position
        newsol.position = max(newsol.position,varmin);
        newsol.position = min(newsol.position,varmax);
        % Evaluation 
        newsol.cost = costfunction(newsol.position);
        % Compare Old Position With New Position
        if newsol.cost < owl(i).cost
            owl(i).position = newsol.position;
            owl(i).cost = newsol.cost;
        end
    end
    % Find And Store And Display Best Solution
    [~,mi] = min([owl.cost]);
    [~,ma] = max([owl.cost]);
    if owl(mi).cost < bestsol.cost
        bestsol = owl(mi);
    end
    if owl(ma).cost > weaksol.cost
        weaksol = owl(ma);
    end
    bestcost(iter) = bestsol.cost;
    disp(['Iteration:' num2str(iter) '     Best Cost:' num2str(bestcost(iter))]);
end 
%% Display Result
figure(1);
semilogy(bestcost,'r','LineWidth',2);
xlabel('Iteration');
ylabel('Cost');
title('Sphere(x)');
disp(['Position Of Best Solution:' num2str(bestsol.position)]);
disp(['Cost Of Best Solution:' num2str(bestsol.cost)]);
