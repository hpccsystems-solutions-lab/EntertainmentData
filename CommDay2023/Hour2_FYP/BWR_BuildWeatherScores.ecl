 WeatherEventRec := RECORD
  string2 state;
  unsigned2 evtsum;
  unsigned2 injsum;
  unsigned2 fatsum;
 END;
 
 WeatherEventDS := DATASET('~FYP::Main::Hacks::WeatherStats',WeatherEventRec,FLAT);

//BuildScore (higher score, better rating)
RankTbl := RECORD
 WeatherEventDS.State;
 // SumEventTbl.SevCode;
 WeatherEventDS.EvtSum;
 WeatherEventDS.InjSum;
 WeatherEventDS.FatSum;
 UNSIGNED1 EvtScore := 0;
 UNSIGNED1 InjScore := 0;
 UNSIGNED1 FatScore := 0;
END;

TempTbl := TABLE(WeatherEventDS,RankTbl);

AddEvtScore := ITERATE(SORT(TempTbl,-EvtSum),TRANSFORM(RankTbl,SELF.EvtScore := IF(LEFT.EvtSum=RIGHT.EvtSum,LEFT.EvtScore,LEFT.EvtScore+1),SELF := RIGHT));
AddInjScore := ITERATE(SORT(AddEvtScore,-InjSum),TRANSFORM(RankTbl,SELF.InjScore := IF(LEFT.InjSum=RIGHT.InjSum,LEFT.InjScore,LEFT.InjScore+1),SELF := RIGHT));
AddFatScore := ITERATE(SORT(AddInjScore,-FatSum),TRANSFORM(RankTbl,SELF.FatScore := IF(LEFT.FatSum=RIGHT.FatSum,LEFT.FatScore,LEFT.FatScore+1),SELF := RIGHT));

OUTPUT(AddFatScore,,'~FYP::Main::Hacks::WeatherScores',NAMED('TopFatalities'),OVERWRITE);