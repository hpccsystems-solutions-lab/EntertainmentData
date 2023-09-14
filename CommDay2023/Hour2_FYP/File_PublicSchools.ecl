/* This dataset was downloaded from: https://hifld-geoplatform.opendata.arcgis.com/datasets/87376bdb0cb3490cbda39935626f6604_0
   This dataset is provided by the Homeland Infrastructure Foundation-Level Data (HIFLD) without a license and for Public Use.
   
   HIFLD Open GP - Education
   Shared By: jrayer_geoplatform
   Data Source: services1.arcgis.com
   Users are advised to read the data set's metadata thoroughly to understand appropriate use and data limitations.
*/
EXPORT File_PublicSchools := MODULE
EXPORT Layout := RECORD
    STRING X;
    STRING Y;
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
    STRING DISTRICTID; //Unique to Public
    STRING FT_TEACHER;
    STRING SHELTER_ID;
END;

EXPORT File  := DATASET('~fyp::main::input::public_schools',layout,CSV(HEADING(1)));

END;