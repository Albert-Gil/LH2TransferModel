function SaveResultsFunction(var1,var2,path,dateandtime)
filename=path+dateandtime+"_"+var1.namedetail+".mat";
save(filename,"var1","var2")
% save(filename,"var1","var2",'-v7.3')
