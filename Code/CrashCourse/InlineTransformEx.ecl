Person_Layout := RECORD
  INTEGER PersonID;
  STRING FirstName;
  STRING LastName;
END;

NameDS := DATASET([
                  {100,'Jo','Smith'},
                  {203,'Dan','Carpenter'},
                  {498,'Sally','Fryman'},
                  {302,'Silver','Rose'}
                  ],Person_Layout);

NameOutRec := RECORD
  UNSIGNED1 RecCount;
  INTEGER   PersonID;
  STRING    PersonName;
  STRING    FutureAddress;
END;                    

CatRecs := PROJECT(nameDS, 
                   TRANSFORM(NameOutRec,
                     SELF.PersonName := LEFT.FirstName + ' ' + LEFT.LastName;
                     SELF.RecCount   := COUNTER;
                     SELF            := LEFT;
                     SELF            := [];
                   ));
               
OUTPUT(CatRecs, NAMED('Inline_CatRecs'));                   