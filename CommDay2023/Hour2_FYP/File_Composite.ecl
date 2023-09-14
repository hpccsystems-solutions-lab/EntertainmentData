//THE HIGHER THE SCORE, THE BETTER THE PARADISE!
EXPORT File_Composite := MODULE
//Crime
 EXPORT CrimeScoreRec := RECORD
  STRING2    State;
  DECIMAL5_4 ViolentCompRat;
  DECIMAL5_4 PropCompRat;
  UNSIGNED1  ViolentScore;
  UNSIGNED1  PropCrimeScore;
 END;
 
 EXPORT CrimeScoreDS := DATASET('~FYP::Main::Hacks::CrimeScores',CrimeScoreRec,FLAT);

//Education
 EXPORT EduScoreRec := RECORD
  STRING2   State;
  INTEGER8  PubCnt;
  INTEGER8  PrvCnt;
  REAL8     AveSTratio;
  UNSIGNED1 StudentTeacherScore;
  UNSIGNED1 PrvSchoolScore;
  UNSIGNED1 PublicSchoolScore;
 END;

 EXPORT EduScoreDS := DATASET('~FYP::Main::Hacks::educationscores',EduScoreRec,FLAT);
 
 //Health
 EXPORT MortScoreRec := RECORD
  STRING2    State;
  DECIMAL5_2 Sumcum;
  DECIMAL5_2 Maxcum;
  DECIMAL5_2 Mincum;
  UNSIGNED1  Mortalityscore;
 END;

 EXPORT MortScoreDS := DATASET('~FYP::Main::Hacks::lifescore',MortScoreRec,FLAT);
 
//Weather
 EXPORT WeatScoreRec := RECORD
  STRING2   state;
  UNSIGNED2 evtsum;
  UNSIGNED2 injsum;
  UNSIGNED2 fatsum;
  UNSIGNED1 evtscore;
  UNSIGNED1 injscore;
  UNSIGNED1 fatscore;
 END;
 
 EXPORT WeatherScoreDS := DATASET('~FYP::Main::Hacks::weatherscores',WeatScoreRec,FLAT);
 
EXPORT Layout := RECORD
  string2  state;
  string20 StateName;
  //ParadiseAggregate
  UNSIGNED2 ParadiseScore;
  //Education Data
  // integer8 stcnt;
  integer8 pubcnt;
  integer8 prvcnt;
  // decimal5_2 prpubrat;
  real8 avestratio;
  UNSIGNED1 StudentTeacherScore;
  UNSIGNED1 PrvSchoolScore;
  UNSIGNED1 PublicSchoolScore;
  //Crime Data
  // real4 violentcrimeratio;
  // real4 homiciderat;
  // real4 raperat;
  // real4 agg_assaultrat;
  DECIMAL5_4 violentcomprat; //aggregate of the above 
  // real4 robberyrat;
  // real4 prop_crimerat;
  // real4 burglaryrat;
  // real4 larcenyrat;
  // real4 veh_theftrat;
  DECIMAL5_4 propcomprat; //aggregate of the above
  UNSIGNED1 ViolentScore;
  UNSIGNED1 PropCrimeScore;
  //Mortality (Health) Data
  DECIMAL5_2 sumcum;
  DECIMAL5_2 maxcum;
  DECIMAL5_2 mincum;
  UNSIGNED1 MortalityScore;
  //Weather Data
  // UNSIGNED1 sevcode;
  UNSIGNED2 evtsum;
  UNSIGNED2 injsum;
  UNSIGNED2 fatsum;
  UNSIGNED1 EvtScore;
  UNSIGNED1 InjScore;
  UNSIGNED1 FatScore;
 END;
 EXPORT File    := DATASET('~FYP::Main::Hacks::ParadiseScores',Layout,THOR);
 EXPORT IDX     := INDEX(File,{ParadiseScore},{File},'~FYP::Main::Hacks::ParadiseIndex');
 EXPORT BLD_IDX := BUILD(IDX,OVERWRITE);
END;

