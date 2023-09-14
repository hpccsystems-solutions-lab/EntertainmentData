/* This dataset, taken from the US Department of Homeland Security, 
   contains information on all public and private schools with attributes regarding their geographical distribution.
   License: Public Domain
*/
EXPORT File_PrivateSchools := MODULE
EXPORT Layout := RECORD
    STRING X;
    STRING Y;
    STRING FID; //Unique to Private 
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
    STRING LEVEL_;
    STRING ENROLLMENT;
    STRING START_GRAD;
    STRING END_GRADE;
    STRING FT_TEACHER;
    STRING SHELTER_ID;
END;

EXPORT File := DATASET('~fyp::main::input::private_schools',layout,CSV(HEADING(1)));

END;