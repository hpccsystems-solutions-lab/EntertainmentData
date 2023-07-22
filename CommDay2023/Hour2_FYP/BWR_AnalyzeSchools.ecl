IMPORT $,STD;
Schools := $.File_AllSchools.File;

//CrossTab by State

//Use this code to profile the All Schools dataset:
// profileResults := STD.DataPatterns.Profile(Schools):PERSIST('~UGA::Persist::SchoolsProfile');
// OUTPUT(profileResults, ALL, NAMED('profileResults'));

//Build Table by State
Rec := RECORD
 Schools.RecID;
 Schools.Public;
 Schools.State;
 Schools.Level;
 Schools.Enrollment;
 Schools.ft_teacher;
 STRatio := ROUND(Schools.Enrollment/Schools.ft_teacher);
END;

SchoolSub   := TABLE(Schools,Rec);
CleanSchSub := SchoolSub(STRatio > 1,Enrollment >= 20);

ByState := TABLE(CleanSchSub,{State,
                              STCnt      := COUNT(GROUP),
                              PubCnt     := COUNT(GROUP,Public=TRUE), 
                              PrvCnt     := COUNT(GROUP,Public=FALSE),
                   DECIMAL5_2 PrPubRat   := 0,
                              AveSTRatio := ROUND(AVE(GROUP,STRatio),2)}
                 ,State);

Clean_ByState := PROJECT(ByState,TRANSFORM(RECORDOF(ByState),
                                           SELF.PrPubRat := (LEFT.PrvCnt/LEFT.PubCnt) * 100,
                                           SELF := LEFT));
// SORT(Clean_ByState,AveStRatio);
OUTPUT(Clean_ByState,,'~FYP::Main::Hacks::EducationSummary',NAMED('CountsRatios'),OVERWRITE);







