IMPORT $;
WeatherDS  := $.File_Composite.WeatherScoreDS;
CrimeDS    := $.File_Composite.CrimeScoreDS;
EdDS       := $.File_Composite.EduScoreDS;
HealthDS   := $.File_Composite.MortScoreDS;
CombLayout := $.File_Composite.Layout;


MergeWeather := PROJECT(WeatherDS,TRANSFORM(CombLayout,SELF.StateName := $.DCT.MapST2Name(LEFT.State),SELF := LEFT,SELF := []));
OUTPUT(MergeWeather,NAMED('AddStateToWeather'));

// ViolentCompRat;
// PropCompRat;
// ViolentScore;
// PropCrimeScore;
MergeCrime := JOIN(MergeWeather,CrimeDS,
                   LEFT.State = Right.State,
                   TRANSFORM(CombLayout,
                             SELF.ViolentCompRat := RIGHT.ViolentCompRat,
                             SELF.PropCompRat    := RIGHT.PropCompRat,
                             SELF.ViolentScore   := RIGHT.ViolentScore,
                             SELF.PropCrimeScore := RIGHT.PropCrimeScore,
                             SELF := LEFT),LOOKUP);
OUTPUT(MergeCrime,NAMED('CrimeandWeather'));

// pubcnt;
// prvcnt;
// avestratio;
// StudentTeacherScore;
// PrvSchoolScore;
// PublicSchoolScore;
MergeEducation := JOIN(MergeCrime,EdDS,
                       LEFT.State = Right.State,
                       TRANSFORM(CombLayout,
                                 SELF.pubcnt              := RIGHT.pubcnt,
                                 SELF.prvcnt              := RIGHT.prvcnt,
                                 SELF.avestratio          := RIGHT.avestratio,
                                 SELF.StudentTeacherScore := RIGHT.StudentTeacherScore,
                                 SELF.PrvSchoolScore      := RIGHT.PrvSchoolScore,
                                 SELF.PublicSchoolScore   := RIGHT.PublicSchoolScore,
                                 SELF := LEFT),LOOKUP);
OUTPUT(MergeEducation,NAMED('CrimeWeatherEducation'));

// sumcum;
// maxcum;
// mincum;
// MortalityScore;
MergeAll := JOIN(MergeEducation,HealthDS,
                    LEFT.State = Right.State,
                    TRANSFORM(CombLayout,
                    SELF.sumcum := RIGHT.sumcum,
                    SELF.maxcum := RIGHT.maxcum,
                    SELF.mincum := RIGHT.mincum,
                    SELF.MortalityScore := RIGHT.MortalityScore,
                    SELF := LEFT),LOOKUP);
                    
CombLayout CompTotal(CombLayout Le) := TRANSFORM
 SELF.ParadiseScore := Le.StudentTeacherScore + Le.PrvSchoolScore + Le.PublicSchoolScore + Le.ViolentScore + Le.PropCrimeScore +
                       Le.MortalityScore + Le.EvtScore + Le.InjScore + Le.FatScore;
 SELF := Le;
END;                    

ParadiseSummary := PROJECT(MergeAll,CompTotal(LEFT));

OUTPUT(ParadiseSummary,,'~FYP::Main::Hacks::ParadiseScores',NAMED('Final_Output'),OVERWRITE);
 