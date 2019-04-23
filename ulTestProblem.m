function [functionValue equalityConstrVals inequalityConstrVals]=ulTestProblem(ulPop, llPop, testProblemName)

    %This function evaluates the upper level objective values and constraints
    %for a set of upper level members and their corresponding lower level members.
    global ulFunctionEvaluations;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Function call here
    fhandle = str2func(testProblemName);
    noOfMembers = size(ulPop,1);
    ulFunctionEvaluations = ulFunctionEvaluations+noOfMembers;


    equalityConstrVals = [];
    inequalityConstrVals = [];
    
    for i=1:noOfMembers
        [functionValue(i,:) equalityConstrValsTemp inequalityConstrValsTemp] = fhandle(ulPop(i,:), llPop(i,:));
        
        if ~isempty(equalityConstrValsTemp)
            equalityConstrVals(i,:) = equalityConstrValsTemp;
        end
        if ~isempty(inequalityConstrValsTemp)
            inequalityConstrVals(i,:) = inequalityConstrValsTemp;
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
function [functionValue equalityConstrVals inequalityConstrVals] = pmm1(x, y)

    functionValue = PMM_leader(x, y, 1);

    functionValue = -functionValue;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Write the constraints here
    inequalityConstrVals = [];
    equalityConstrVals = [];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
