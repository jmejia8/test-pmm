function pmmProblem()
addpath('BLEAQ2');
addpath('bilevel-benchmark');

problemName = 'pmm1';             % Test problem name

ulPopSize=100;                    % Size of UL population
ulMaxGens=1000;                  % Maximum number of generations allowed at UL
ulDim=5;                         % Number of UL dimensions

llPopSize=100;                    % Size of LL population
llMaxGens=1000;                  % Maximum number of generations allowed at LL
llDim=5;                         % Number of LL dimensions

ulDimMin = -10*ones(1, ulDim);            % Minimum value accross UL dimensions
ulDimMax = 10*ones(1, ulDim);              % Maximum value accross UL dimensions

llDimMin = ulDimMin;      % Minimum value accross LL dimensions
llDimMax = ulDimMax;     % Maximum value accross LL dimensions

ulStoppingCriteria = 1e-5;
llStoppingCriteria = 1e-5;

[ulEliteFunctionValue, llEliteFunctionValue, ulEliteIndiv, llEliteIndiv, ulFunctionEvaluations, llFunctionEvaluations]=ulSearch(problemName, ulPopSize, ulMaxGens, ulDim, ulDimMin, ulDimMax, llPopSize, llMaxGens, llDim, llDimMin, llDimMax, ulStoppingCriteria, llStoppingCriteria)

save('pmm1');

