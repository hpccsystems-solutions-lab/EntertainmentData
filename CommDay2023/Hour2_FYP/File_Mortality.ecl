/* IHME United States Mortality Rates by County 1980-2014: National - All. (Deaths per 100,000 population)
   https://www.kaggle.com/datasets/IHME/us-countylevel-mortality
   License: 
   This Dataset was provided by IHME
   Institute for Health Metrics and Evaluation
   Data made available for download on IHME Websites can be used, shared, modified or built upon by non-commercial users in accordance with the IHME FREE-OF-CHARGE
*/

EXPORT File_Mortality := MODULE
EXPORT Layout := RECORD
    STRING42 Location;
    STRING5 FIPS;
    STRING65 Category;
    REAL4 Mortality_Rate__1980_;
    REAL4 Mortality_Rate__1980___Min_;
    REAL4 Mortality_Rate__1980___Max_;
    REAL4 Mortality_Rate__1985_;
    REAL4 Mortality_Rate__1985___Min_;
    REAL4 Mortality_Rate__1985___Max_;
    REAL4 Mortality_Rate__1990_;
    REAL4 Mortality_Rate__1990___Min_;
    REAL4 Mortality_Rate__1990___Max_;
    REAL4 Mortality_Rate__1995_;
    REAL4 Mortality_Rate__1995___Min_;
    REAL4 Mortality_Rate__1995___Max_;
    REAL4 Mortality_Rate__2000_;
    REAL4 Mortality_Rate__2000___Min_;
    REAL4 Mortality_Rate__2000___Max_;
    REAL4 Mortality_Rate__2005_;
    REAL4 Mortality_Rate__2005___Min_;
    REAL4 Mortality_Rate__2005___Max_;
    REAL4 Mortality_Rate__2010_;
    REAL4 Mortality_Rate__2010___Min_;
    REAL4 Mortality_Rate__2010___Max_;
    REAL4 Mortality_Rate__2014_;
    REAL4 Mortality_Rate__2014___Min_;
    REAL4 Mortality_Rate__2014___Max_;
    REAL4 Change_in_Mortality_Rate__1980_2014;
    REAL4 Change_in_Mortality_Rate__1980_2014__Min_;
    REAL4 Change_in_Mortality_Rate__1980_2014__Max_;
END;

EXPORT File := DATASET('~fyp::main::input::mortalitybyuscounty',layout,CSV(HEADING(1)));

// From: https://ghdx.healthdata.org/record/ihme-data/united-states-life-expectancy-by-state-white-black-hispanic-race-ethnicity-1990-2019
// Mortality By State
/* Estimates were produced for mortality rates, life expectancy, and population at the state level in the United States, 
   and by racial/ethnic group, for each year between 1990-2019. 
   These estimates were produced using population and deaths data from the National Center for Health Statistics.
*/

EXPORT Layout2 := RECORD  //Best Record generated
    UNSIGNED1 measure_id;
    STRING24 measure_name;
    UNSIGNED3 location_id;
    STRING47 location_name;
    STRING20 state_name;
    STRING25 race_ethnicity_group;
    UNSIGNED1 sex_id;
    STRING6 sex_name;
    UNSIGNED2 age_group_id;
    STRING8 age_group_name;
    UNSIGNED2 year_id;
    UNSIGNED1 metric_id;
    STRING6 metric_name;
    STRING11 val;
    STRING11 upper;
    STRING11 lower;
END;

EXPORT File2 := DATASET('~fyp::main::input::mortalitybygenderandrace',Layout2,CSV(HEADING(1)));

END;