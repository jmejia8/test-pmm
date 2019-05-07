function [functionValue equalityConstrVals inequalityConstrVals]=llTestProblem(llPop, testProblemName, ulMember)

    %This function evaluates the lower level objective values and constraints
    %for a set of lower level members corresponding to a given upper level member.
    global llFunctionEvaluations;
    noOfMembers = size(llPop,1);
    llFunctionEvaluations = llFunctionEvaluations + noOfMembers;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Function call here
    fhandle = str2func(testProblemName);
    equalityConstrVals = [];
    inequalityConstrVals = [];
    
    for i=1:noOfMembers
        if size(llPop,1) == size(ulMember,1)
            [functionValue(i,:) equalityConstrValsTemp inequalityConstrValsTemp] = fhandle(ulMember(i,:), llPop(i,:));
        elseif size(ulMember,1) == 1
            [functionValue(i,:) equalityConstrValsTemp inequalityConstrValsTemp] = fhandle(ulMember, llPop(i,:));
        else
            disp('Error in llTestProblem, size of llPop and ulMember mismatch');
        end
        
        if ~isempty(equalityConstrValsTemp)
            equalityConstrVals(i,:) = equalityConstrValsTemp;
        end
        if ~isempty(inequalityConstrValsTemp)
            inequalityConstrVals(i,:) = inequalityConstrValsTemp;
        end
    end    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
function [functionValue equalityConstrVals inequalityConstrVals] = pmm(x, y)
    global fnum_global;
    functionValue = PMM_follower(x, y, fnum_global);    

    functionValue = -functionValue;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Write the constraints here
    inequalityConstrVals = [];
    equalityConstrVals = [];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
