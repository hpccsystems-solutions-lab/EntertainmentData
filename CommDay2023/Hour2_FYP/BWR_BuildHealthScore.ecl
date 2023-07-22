HealthRec := RECORD
  string2 state;
  decimal5_2 sumcum;
  decimal5_2 maxcum;
  decimal5_2 mincum;
END; 

Health_DS := DATASET('~FYP::Main::Hacks::Mortality',HealthRec,FLAT);


 //BuildScores (higher score, better rating)
 
RankTbl := RECORD
 Health_DS.State;
 Health_DS.sumcum;
 Health_DS.maxcum;
 Health_DS.mincum;
 UNSIGNED1 MortalityScore := 0;
END;

TempTbl := TABLE(Health_DS,RankTbl);

AddLifeScore := ITERATE(SORT(TempTbl,-sumcum),
                        TRANSFORM(RankTbl,
                                  SELF.MortalityScore := IF(LEFT.sumcum=RIGHT.sumcum,LEFT.MortalityScore,LEFT.MortalityScore+1),
                                  SELF := RIGHT));

OUTPUT(AddLifeScore,,'~FYP::Main::Hacks::LifeScore',NAMED('TopLife'),OVERWRITE);