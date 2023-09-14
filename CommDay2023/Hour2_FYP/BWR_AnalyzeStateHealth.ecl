IMPORT $,STD;
StateMort := $.File_Mortality.File2;

// bestrecord := STD.DataPatterns.BestRecordStructure(StateMort);
// OUTPUT(bestrecord,ALL);

DISTRIBUTION(StateMort,race_ethnicity_group);


