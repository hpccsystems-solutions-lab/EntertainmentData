SalaryAvg_layout := RECORD
 STRING  Job;
 STRING  Category;
 STRING  City;
 STRING2 State;
 INTEGER Avg_Salary;
END;

//Inline Dataset
SalaryAvg_DS := DATASET([
                          {'Manager','IT','Atlanta','GA', 87000},
                          {'Director','Art','Atlanta','GA', 100000},
                          {'CIO','IT','Tampa','FL', 112000},
                          {'Sales','General','Chicago','IL', 55000}
                         ],SalaryAvg_Layout
                         );
//Output                         
OUTPUT(SalaryAvg_DS, NAMED('SalaryAvg_DS'));

//Choosen
OUTPUT(CHOOSEN(SalaryAvg_DS,2), NAMED('SalaryAvg_Choosen'));

//Sort
SortJobs := SORT(SalaryAvg_DS, Job);
OUTPUT(SortJobs,NAMED('SortJobs'));

//Filter
OUTPUT(SalaryAvg_DS(City = 'Tampa'), NAMED('Tampa_Filter'));


                         
                         