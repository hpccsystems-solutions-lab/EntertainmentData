EXPORT File_AllData := MODULE
 EXPORT AllDataSF := '~CLASS::BMF::SF::Alldata'; 
 EXPORT WeeklySF  := '~CLASS::BMF::SF::Weekly'; 
 EXPORT DailySF   := '~CLASS::BMF::SF::Daily';
 EXPORT Base1 := '~ecltraining::in::namephonesupd1';
  // 1G
 EXPORT Base2 := '~CLASS::BMF::SF::NewBaseRollup';
 // 1C 
 SHARED Rec := RECORD
  UNSIGNED4 recid;
  UNSIGNED4 foreignkey;
  STRING10  homephone;
  STRING10  cellphone;
  STRING20  fname;
  STRING20  mname;
  STRING20  lname;
  STRING5   name_suffix;
 END;
 EXPORT AllDataDS := DATASET(AllDataSF,Rec,THOR);
 EXPORT WeeklyDS  := DATASET(WeeklySF,Rec,THOR);
 EXPORT DailyDS   := DATASET(DailySF,Rec,THOR);
END; 































 // 1B
 // EXPORT Base1 := '~ecltraining::in::namephonesupd1';
 // 1G
 // EXPORT Base2 := '~CLASS::BMF::SF::NewBaseRollup1';
 // 1C 
 // SHARED Rec := RECORD
  // UNSIGNED4 recid;
  // UNSIGNED4 foreignkey;
  // STRING10  homephone;
  // STRING10  cellphone;
  // STRING20  fname;
  // STRING20  mname;
  // STRING20  lname;
  // STRING5   name_suffix;
 // END;
 // EXPORT AllDataDS := DATASET(AllDataSF,Rec,THOR);
 // EXPORT WeeklyDS  := DATASET(WeeklySF,Rec,THOR);
 // EXPORT DailyDS   := DATASET(DailySF,Rec,THOR);
// END;
