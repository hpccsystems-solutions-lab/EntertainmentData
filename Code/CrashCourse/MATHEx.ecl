Mathlayout := RECORD
  INTEGER Num1;
  INTEGER Num2;
  INTEGER Num3;
END;

DS := DATASET([
                {20,45,34},
                {909,56,45},
                {30,-1,90}
              ],MathLayout);

COUNT(DS);               //Counts the number of records in the dataset -- Returns 3
MAX(DS,Num1);            //Returns the maximum value on a field in the dataset -- Returns 909
MIN(DS,Num2);            //Returns the minimum value on a field in the dataset -- Returns -1
AVE(DS,Num1);            //Returns the average value on a field in the dataset -- Returns 319.6666666666667
SUM(DS, Num1 + Num3);    //Returns the result of adding numbers together -- Returns 1128
TRUNCATE(AVE(DS,Num1));  //Returns the interger portion of the real value. -- 319
ROUND(3.45);             //Returns the rounded value -- Return 3
ROUND(3.76);             //Returns the rounded value -- Return 4

