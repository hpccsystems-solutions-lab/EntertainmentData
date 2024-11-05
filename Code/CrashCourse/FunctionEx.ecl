myfunc (STRING val) := FUNCTION
  Result := 'Hello ' + val + ' , welcome to this function';
  RETURN Result;
END;

//Using myfunc
res := myfunc('Trish');
OUTPUT(res, NAMED('FunctionResult'));

OUTPUT(myfunc('George'),NAMED('GeorgeTest'));

//Single line function:
MaxVal(SET OF INTEGER numlist) := MAX(numlist);
OUTPUT(MaxVal([2,5,8,10,45,11]),NAMED('CheckMax'));