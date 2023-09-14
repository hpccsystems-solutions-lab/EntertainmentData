EXPORT File_AllSchools := MODULE
//Best layout from BWR_BuildSchools
EXPORT Layout := RECORD
    UNSIGNED8 RecID;
    BOOLEAN   Public;
    REAL8     x;
    REAL8     y;
    STRING6   fid;
    UNSIGNED4 districtid;
    UNSIGNED3 objectid;
    STRING12  ncesid;
    STRING60  name;
    STRING56  address;
    STRING26  city;
    STRING2   state;
    STRING5   zip;
    STRING13  zip4;
    STRING14  telephone;
    UNSIGNED1 type;
    UNSIGNED1 status;
    INTEGER3  population;
    STRING21  county;
    STRING5   countyfips;
    STRING3   country;
    REAL8     latitude;
    REAL8     longitude;
    UNSIGNED3 naics_code;
    STRING32  naics_desc;
    STRING79  source;
    STRING19  sourcedate;
    STRING13  val_method;
    STRING19  val_date;
    STRING80  website;
    STRING15  level;
    INTEGER3  enrollment;
    STRING2   start_grad;
    STRING2   end_grade;
    INTEGER2  ft_teacher;
    STRING13  shelter_id;
END;

EXPORT File := DATASET('~FYP::Main::OUT::AllUSSchools',Layout,THOR);

END;