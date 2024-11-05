Person_Layout := RECORD
  STRING FirstName;
  STRING LastName;
END;

NameDS := DATASET([
                  {'Sun','Shine'},
                  {'Blue','Moon'},
                  {'Silver','Rose'}
                  ],Person_Layout);

NameOutRec := RECORD
  STRING15  FirstName;
  STRING15  LastName;
  STRING15  CatValues;
  UNSIGNED1 RecCount;
END;                    

NameOutRec CatThem(Person_Layout Le,INTEGER Ct) := TRANSFORM
  SELF.CatValues := TRIM(Le.FirstName) + ' ' + Le.LastName;
  SELF.RecCount  := Ct;
  SELF           := Le;
END;

CatRecs := PROJECT(nameDS, //dataset to loop through
                   CatThem //Transform name
                   (LEFT,  //Left dataset which is nameDS
                   COUNTER //Simple Counter
                   ));

OUTPUT(CatRecs, NAMED('CatRecs'));                   