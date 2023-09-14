IMPORT $,STD;
Life    := $.File_Mortality.File;
LifeRec := $.File_Mortality.Layout;
StFIPS  := $.File_StateFIPS.File;

// bestrecord := STD.DataPatterns.BestRecordStructure(Life);
// OUTPUT(bestrecord,ALL);

// Use this code to profile the Mortality dataset:
// profileResults := STD.DataPatterns.Profile(Life):PERSIST('~BMF::UGA::Persist::LifeProfile');
// OUTPUT(profileResults, ALL, NAMED('profileResults'));


// DISTRIBUTION(Life,Category); //Along with the profiling above, this gives you a quick way to analyze fields of interest.

NewLifeRec := RECORD
 STRING2 State;
 LifeRec;
END;

NewLifeRec AddState(Life Le,StFIPS Ri) := TRANSFORM
 SELF.State := Ri.State;
 SELF       := Le;
END; 

JoinState := JOIN(Life,StFips,LEFT.FIPS = RIGHT.StateCode+RIGHT.FIPS,AddState(LEFT,RIGHT),LEFT OUTER,LOOKUP);

OUTPUT(JoinState,NAMED('StateAdded'));

//Grab the State aggregates for scoring
FilterFIPS := JoinState(LENGTH(TRIM(FIPS)) <= 2);//,{JoinState},Category);
// FilterFIPS;
JoinState2 := JOIN(FilterFIPS,StFips,LEFT.FIPS=(STRING)RIGHT.StateCode,TRANSFORM(NewLifeRec,SELF.State := RIGHT.State,SELF := LEFT),LOOKUP);
OUTPUT(JoinState2,NAMED('StateOnly')); 

//CrossTab Life File by State - and get averages!
CTRec := RECORD
JoinState2.State;
DECIMAL5_2 SumCum := ROUND(AVE(GROUP,JoinState2.Change_in_Mortality_Rate__1980_2014),2);
DECIMAL5_2 MaxCum := ROUND(AVE(GROUP,JoinState2.Change_in_Mortality_Rate__1980_2014__Max_),2);
DECIMAL5_2 MinCum := ROUND(AVE(GROUP,JoinState2.Change_in_Mortality_Rate__1980_2014__Min_),2);
END;

LifeSum := SORT(TABLE(JoinState2,CTRec,State),SumCum);
OUTPUT(LifeSum,,'~FYP::Main::Hacks::Mortality',NAMED('MortalityAverages'),OVERWRITE);
