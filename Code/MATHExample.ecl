MathLayout := RECORD
 INTEGER Num1;
 INTEGER Num2;
 INTEGER Num3;
END;

DS := DATASET([{20,45,34},
               {909,56,45},
               {30,-1,90}],
               MathLayout);
//See slides for comments            
COUNT(DS);
MAX(DS,Num1);
MIN(DS,Num2);
AVE(DS,Num1);
SUM(DS,Num1+Num3);
TRUNCATE(AVE(DS,Num1));
ROUND(3.45);
ROUND(3.76); 

              