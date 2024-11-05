EMP_Layout   := {INTEGER EmpID,STRING Name,INTEGER HireYear};
JobCatLayout := {INTEGER EmpID,STRING Department,STRING Title};

EmpDS := DATASET([
                 {1000,'Jack',2014},
                 {2000,'Blue',2016},
                 {3000,'Mary',2016},
                 {5000,'Marty',2000},
                 {8000,'Cat',2002}
                 ],EMP_Layout);

JobCatDS := DATASET([
                    {1000,'IT','Developer'},
                    {2000,'Biz','Manager'},
                    {4000,'Fin','Accountant'},
                    {8000,'IT','Analyst'}
                    ],JobCatLayout);

InnerJoin := JOIN(EmpDS,JobCatDS,
                  LEFT.EmpID=RIGHT.EmpID);

LeftOuterJoin := JOIN(EmpDS,JobCatDS,
                  LEFT.EmpID=RIGHT.EmpID,
                  LEFT OUTER);

FullOuterJoin := JOIN(EmpDS,JobCatDS,
                  LEFT.EmpID=RIGHT.EmpID,
                  FULL OUTER);

OUTPUT(InnerJoin);
OUTPUT(LeftOuterJoin);
OUTPUT(FullOuterJoin);                                     