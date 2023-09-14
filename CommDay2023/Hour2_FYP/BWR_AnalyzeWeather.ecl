IMPORT $,STD;
Storm    := $.File_Weather.File;
StormRec := $.File_Weather.Layout;
StFIPS   := $.File_StateFIPS.File;

// bestrecord := STD.DataPatterns.BestRecordStructure(Storm);
// OUTPUT(bestrecord,ALL);

// Use this code to profile the Crime dataset:
// profileResults := STD.DataPatterns.Profile(Storm):PERSIST('~BMF::UGA::Persist::StormProfile');
// OUTPUT(profileResults, ALL, NAMED('profileResults'));

//AddState and Sequence
NewStormRec := RECORD
 UNSIGNED4 RecID;
 STRING2   State;
 StormRec;
END;

SeqRecs := PROJECT(Storm,TRANSFORM(NewStormRec,SELF.RecID := COUNTER,SELF.State := '',SELF := LEFT)); //Sequence by COUNTER

JoinState := JOIN(SeqRecs((INTEGER)State_Fips BETWEEN 1 AND 80),StFIPS,LEFT.State_Fips=RIGHT.StateCode,
                  TRANSFORM(NewStormRec,
                            SELF.State := RIGHT.State,
                            SELF := LEFT)
                  ,LOOKUP,LEFT OUTER);

//(1) CrossTab by StateCode
CTRec := RECORD
 JoinState.State;
 StCnt := COUNT(GROUP);
END;

CtTbl := TABLE(JoinState,CTRec,State,State);
// OUTPUT(SORT(CtTbl,-StCnt));

//Create a Weather Score DATASET
BaseScoreRec := RECORD
STRING2   State;
UNSIGNED2 Reports; //Total Incidents by State 
END; 

AddIncidents := PROJECT(CtTbl,TRANSFORM(BaseScoreRec,SELF.Reports := LEFT.StCnt,SELF := LEFT));
// AddIncidents;

//CrossTab by State, Event_Type
CTEvent := RECORD
 JoinState.State;
 JoinState.EVENT_TYPE;
 EvtCnt := COUNT(GROUP);
 injcnt := SUM(GROUP,JoinState.injuries_direct)+SUM(GROUP,JoinState.injuries_indirect);
 deaths := SUM(GROUP,JoinState.deaths_direct)+SUM(GROUP,JoinState.deaths_indirect);
 // damage := SUM(GROUP,JoinState.damage_property)+SUM(GROUP,JoinState.damage_crops);   
END; 

EvTbl := TABLE(JoinState,CTEvent,State,Event_Type);
// OUTPUT(SORT(EvTbl,-EvtCnt));
//Assign Severity Code from Dictionary (See DCT Module) 
SevRec := RECORD
RECORDOF(EvTbl);
UNSIGNED1 SevCode;
END;

BuildSev := PROJECT(EvTbl,TRANSFORM(SevRec,SELF.SevCode := $.DCT.MapCodeToType(TRIM(LEFT.event_type,LEFT,RIGHT)),SELF := LEFT));
// OUTPUT(BuildSev(sevcode = 0));

SevClean2 := PROJECT(BuildSev,TRANSFORM(SevRec,SELF.SevCode := CASE(LEFT.Event_Type,'Astronomical Low Tide'=> 6,
                                                                                    'Tropical Depression' => 4,
                                                                                    'Extreme Cold/Wind Chill' => 1,
                                                                                    LEFT.SevCode),SELF := LEFT));

OUTPUT(SevClean2,NAMED('AddSeverity'));

WeatherScoreRec := RECORD
 SevClean2.State;
 SevClean2.SevCode;
 SevCnt := COUNT(GROUP);
 InjCnt := SUM(GROUP,SevClean2.injcnt);
 FatCnt := SUM(GROUP,SevClean2.deaths);
END;

SevTbl := SORT(TABLE(SevClean2,WeatherScoreRec,State,SevCode),State);
OUTPUT(SevTbl,NAMED('ST_Sev'));

//Consolidate weather events by State, SevCode (aggregate fatalities)
SumEventsRec := RECORD
 SevTbl.State;
 // SevTbl.SevCode;
 UNSIGNED2 EvtSum := SUM(GROUP,SevTbl.SevCnt);
 UNSIGNED2 InjSum := SUM(GROUP,SevTbl.InjCnt);
 UNSIGNED2 FatSum := SUM(GROUP,SevTbl.FatCnt);
END;

// SumEventTbl := SORT(TABLE(SevTbl,SumEventsRec,State,SevCode),State);
SumEventTbl := SORT(TABLE(SevTbl,SumEventsRec,State),State);

// OUTPUT(SumEventTbl, NAMED('StateEventSum'));
OUTPUT(SumEventTbl,,'~FYP::Main::Hacks::WeatherStats',NAMED('WeatherEvents'),OVERWRITE);














