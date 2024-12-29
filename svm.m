classdef svm
    methods (Static)
        function Model=train(training, groupnames, varargin)
            classInstance=unique(groupnames);
            svmValue=sum(classInstance);
            nsample=length(classInstance);
            if nsample>2
                model=cell(1,nsample);
                for i=1:nsample
                    classx=groupnames;
                    classx(classx==classInstance(i))=svmValue;
                    classx(classx~=svmValue)=1;
                    classx(classx==svmValue)=0;
                    model{i}=fitcsvm(training,classx,varargin{:});
                    fprintf('Multi Class SVM Model for Class Instance %d --->\n',classInstance(i))
                    disp(model{i})
                end
            else
                model=fitcsvm(training,groupnames,varargin{:});
                fprintf('\nx Two class svm  Model--->\n')
                disp(model)
            end
            Model.model=model;
            Model.classInstance=classInstance;           
            
        end
        
        function output=predict(Model,sample,varargin)            
            model=Model.model;
            classInstance=Model.classInstance;
            nsample=length(classInstance);
            if nsample>2
                numberOfSamples=size(sample,1);
                classRange=zeros(numberOfSamples,length(classInstance));
                for i=1:nsample
                    [~,threshold]=svm.svmclassify(model{i},sample,varargin{:});
                    classRange(:,i)=threshold;
                    fprintf('\nMulti Class SVM classify values Claculated  for Class Instance %d ',classInstance(i))
                end
                [~,index]=max(transpose(classRange));
                output=classInstance(index);
            else
                output=svm.svmclassify(model,sample,varargin{:});
            end
            fprintf('\n SVM Classification is completed\n')
        end
        
        function [outclass,val] = svmclassify(svmStruct,sample, varargin)
                    
            plotflag = false;
                        
            narginchk(2, Inf);
                        
            if ~isstruct(svmStruct)
                error(message('stats:svmclassify:TwoInputsNoStruct'));
            end
            
            if ~isnumeric(sample) || ~ismatrix(sample)
                error(message('stats:svmclassify:BadSample'));
            end
            
            if size(sample,2)~=size(svmStruct.SupportVectors,2)
                error(message('stats:svmclassify:TestSizeMismatch'));
            end
                        
            if nargin > 2
                if rem(nargin,2) == 1
                    error(message('stats:svmclassify:IncorrectNumberOfArguments'));
                end
                okargs = {'showplot','-compilerhelper'};
                for j=1:2:nargin-2
                    pname = varargin{j};
                    pval = varargin{j+1};
                    k = find(strncmpi(pname, okargs,numel(pname)));
                    if isempty(k)
                        error(message('stats:svmclassify:UnknownParameterName', pname));
                    elseif length(k)>1
                        error(message('stats:svmclassify:AmbiguousParameterName', pname));
                    else
                        switch(k)
                            case 1 
                                plotflag = opttf(pval,okargs{k});
                            case 2 
                                fitcsvm(eye(2),[1 0]);
                        end
                    end
                end
            end
            
            groupnames = svmStruct.GroupNames;
            
            if ~isvector(groupnames) && ~ischar(groupnames)
                error(message('stats:svmclassify:GroupNotVector'));
            end
            
            [~,groupString,glevels] = grp2idx(groupnames);
            
            if ~isempty(sample)            
                sampleOrig = sample;
                if ~isempty(svmStruct.ScaleData)
                    for c = 1:size(sample, 2)
                        sample(:,c) = svmStruct.ScaleData.scaleFactor(c) * ...
                            (sample(:,c) +  svmStruct.ScaleData.shift(c));
                    end
                end
                                
                [outclass,val] = svm.svmdecision(sample,svmStruct);                
                if plotflag
                    
                    if isempty(svmStruct.FigureHandles)
                        warning(message('stats:svmclassify:NoTrainingFigure'));
                        
                    else
                        try
                            hAxis = svmStruct.FigureHandles{1};
                            hLines = svmStruct.FigureHandles{2};
                            hSV = svmStruct.FigureHandles{3};                            
                            [~,hClassLines] = svmplotdata(sampleOrig,outclass,hAxis);
                            trainingString = strcat(cellstr(groupString),' (training)');
                            sampleString = strcat(cellstr(groupString),' (classified)');
                            legend([hLines(1),hClassLines(1),hLines(2),hClassLines(2),hSV],...
                                {trainingString{1},sampleString{1},...
                                trainingString{2},sampleString{2},'Support Vectors'});
                        catch ME
                            warning(message('stats:svmclassify:DisplayFailed', ME.message));
                        end
                    end
                end
                outclass(outclass == -1) = 2;
                unClassified = isnan(outclass);
                outclass = glevels(outclass(~unClassified),:);
                if any(unClassified)
                    
                    try
                        outclass = statinsertnan(unClassified,outclass);
                    catch ME
                        if ~isequal(ME.identifier,'stats:statinsertnan:LogicalInput')
                            rethrow(ME);
                        else
                            error(message('stats:svmclassify:logicalwithNaN'));
                        end
                    end
                end
                
            else
                outclass = [];
            end
            
        end
        function [out,f] = svmdecision(Xnew,svm_struct)
                        
            sv = svm_struct.SupportVectors;
            alphaHat = svm_struct.Alpha;
            bias = svm_struct.Bias;
            kfun = svm_struct.KernelFunction;
            kfunargs = svm_struct.KernelFunctionArgs;
            
            f = (feval(kfun,sv,Xnew,kfunargs{:})'*alphaHat(:)) + bias;
            out = sign(f);            
            out(out==0) = 1;
        end
        
        function [Model,predicted] = classify(Sample,class,SampleTest)
            Model=svm.train(Sample,class);
            predicted=svm.predict(Model,SampleTest);
        end
    end
end