function [ulEliteFunctionValue, llEliteFunctionValue, ulEliteIndiv, llEliteIndiv, ulFunctionEvaluations, llFunctionEvaluations,llCalls,gen,ulDim,llDim,ulPopSize,llPopSize] = pmmProblem(fnum)
addpath('BLEAQ2');
addpath('bilevel-benchmark');


problemName = 'pmm';             % Test problem name
if nargin == 0
    fnum = 1;
% else
%     problemName = strcat('pmm', int2str(fnum))
end
global fnum_global;
fnum_global = fnum;

ulPopSize=100;                    % Size of UL population
ulMaxGens=1000;                  % Maximum number of generations allowed at UL
ulDim=2;                         % Number of UL dimensions

llPopSize=100;                    % Size of LL population
llMaxGens=1000;                  % Maximum number of generations allowed at LL
llDim=3;                         % Number of LL dimensions

ulDimMin = -10*ones(1, ulDim);            % Minimum value accross UL dimensions
ulDimMax = 10*ones(1, ulDim);              % Maximum value accross UL dimensions

llDimMin = -10*ones(1, llDim);      % Minimum value accross LL dimensions
llDimMax = 10*ones(1, llDim);     % Maximum value accross LL dimensions

ulStoppingCriteria = 1e-5;
llStoppingCriteria = 1e-5;

[ulEliteFunctionValue, llEliteFunctionValue, ulEliteIndiv, llEliteIndiv, ulFunctionEvaluations, llFunctionEvaluations]=ulSearch(problemName, ulPopSize, ulMaxGens, ulDim, ulDimMin, ulDimMax, llPopSize, llMaxGens, llDim, llDimMin, llDimMax, ulStoppingCriteria, llStoppingCriteria)

% save('pmm1');

