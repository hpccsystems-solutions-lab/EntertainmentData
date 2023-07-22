IMPORT $,STD;
//Combine Public and Private into an All Schools Dataset
Public  := $.File_PublicSchools.File;
Private := $.File_PrivateSchools.File;

CombRec := RECORD //Combination of Public and Private
    UNSIGNED RecID;
    BOOLEAN Public; 
    STRING X;
    STRING Y;
    STRING FID;        //Unique to Private 
    STRING DISTRICTID; //Unique to Public
    STRING OBJECTID;
    STRING NCESID;
    STRING NAME;
    STRING ADDRESS;
    STRING CITY;
    STRING STATE;
    STRING ZIP;
    STRING ZIP4;
    STRING TELEPHONE;
    STRING TYPE;
    STRING STATUS;
    STRING POPULATION;
    STRING COUNTY;
    STRING COUNTYFIPS;
    STRING COUNTRY;
    STRING LATITUDE;
    STRING LONGITUDE;
    STRING NAICS_CODE;
    STRING NAICS_DESC;
    STRING SOURCE;
    STRING SOURCEDATE;
    STRING VAL_METHOD;
    STRING VAL_DATE;
    STRING WEBSITE;
    STRING LEVEL;
    STRING ENROLLMENT;  //Total Enrollment
    STRING START_GRAD;
    STRING END_GRADE;
    STRING FT_TEACHER;  //Full-time teachers
    STRING SHELTER_ID;
END;

AddPublic  := PROJECT(Public,TRANSFORM(CombRec,
                                       SELF.RecID := 0,
                                       SELF.fid := 'PUBLIC',
                                       SELF.LEVEL := LEFT.LEVEL_,
                                       SELF.Public := TRUE,
                                       SELF := LEFT));
AddPrivate := PROJECT(Private,TRANSFORM(CombRec,SELF.RecID := 0,SELF.DISTRICTID := 'PRIVATE',SELF.LEVEL := LEFT.LEVEL_,SELF.Public := FALSE,SELF := LEFT));
SeqAll     := PROJECT(AddPublic+AddPrivate,TRANSFORM(CombRec,SELF.RecID := COUNTER,SELF := LEFT));
out        := OUTPUT(SeqAll,,'~FYP::Main::OUT::AllUSSchools',OVERWRITE); //default to FLAT/THOR
temp       := DATASET('~FYP::Main::OUT::AllUSSchools',combRec,THOR);

bestrecord := STD.DataPatterns.BestRecordStructure(temp);
BestRecOut := OUTPUT(bestrecord,ALL);

SEQUENTIAL(out,BestRecOut);


