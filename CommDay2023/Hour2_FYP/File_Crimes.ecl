EXPORT File_Crimes := MODULE
/* This dataset contains estimated data at the state and national level and was derived from the Summary Reporting System (SRS). 
   These data reflect the estimates the FBI has traditionally included in its annual publications. 
   Download this dataset to see the FBI's estimated crime totals for the nation and all 50 states, 1979 to current year available.
   Source: https://cde.ucr.cjis.gov/LATEST/webapp/#/pages/downloads#nibrs-downloads
*/
 EXPORT Layout := RECORD
  UNSIGNED2 year;
  STRING2   state_abbr;
  STRING20  state_name;
  UNSIGNED5 population;
  UNSIGNED4 violent_crime;
  UNSIGNED3 homicide;
  UNSIGNED3 rape_legacy;
  UNSIGNED3 rape_revised;
  UNSIGNED3 robbery;
  UNSIGNED4 aggravated_assault;
  UNSIGNED4 property_crime;
  UNSIGNED4 burglary;
  UNSIGNED4 larceny;
  UNSIGNED4 motor_vehicle_theft;
  STRING577 caveats;
 END;

EXPORT File := DATASET('~fyp::main::input::estimated_crimes_1979_2020',Layout,CSV(HEADING(1)));


/* This optional data set contains statistics, in arrests per 100,000 residents for assault, murder, and rape in each of the 50 US states in 1973. Also given is the percent of the population living in urban areas.
   A data frame with 50 observations on 4 variables.
   
   Murder is numeric and Murder arrests (per 100,000)
   Assault is numeric and Assault arrests (per 100,000)
   UrbanPop is numeric and UrbanPop arrests (per 100,000)
   Rape is numeric and Rape arrests (per 100,000)

Source: World Almanac and Book of facts 1975. (Crime rates).
Statistical Abstracts of the United States 1975. (Urban rates).

https://www.kaggle.com/datasets/mathchi/violent-crime-rates-by-us-state
*/
 EXPORT Layout2 := RECORD
    STRING State;
    STRING Murder;
    STRING Assault;
    STRING UrbanPop;
    STRING Rape;
 END;
 EXPORT File2 := DATASET('~fyp::main::input::us_violent_crime_summary',layout2,CSV(HEADING(1)));

END;