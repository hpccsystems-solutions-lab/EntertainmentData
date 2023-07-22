/* The Storm Events Database contains the records used to create the official NOAA Storm Data publication, documenting:
   
   The occurrence of storms and other significant weather phenomena having sufficient intensity to cause loss of life, injuries, significant property damage, and/or disruption to commerce;
   Rare, unusual, weather phenomena that generate media attention, such as snow flurries in South Florida or the San Diego coastal area; and
   Other significant meteorological events, such as record maximum or minimum temperatures or precipitation that occur in connection with another event.
   
   The database currently contains data from January 1950 to October 2022, as entered by NOAA's National Weather Service (NWS).
   https://www.ncdc.noaa.gov/stormevents/
*/


EXPORT File_Weather := MODULE
EXPORT Layout := RECORD //RECORD Optimized using BestRecord function (See BWR_AnalyzeWeather)
    UNSIGNED3 begin_yearmonth;
    UNSIGNED3 begin_day;
    UNSIGNED3 begin_time;
    UNSIGNED3 end_yearmonth;
    REAL4     end_day;
    STRING4   end_time;
    STRING45  episode_id;
    REAL8     event_id;
    STRING20  state;
    INTEGER4  state_fips;
    UNSIGNED4 year;
    STRING9   month_name;
    STRING    event_type;
    STRING1   cz_type;
    UNSIGNED2 cz_fips;
    STRING109 cz_name;
    STRING3   wfo;
    STRING18  begin_date_time;
    STRING6   cz_timezone;
    STRING18  end_date_time;
    UNSIGNED2 injuries_direct;
    UNSIGNED2 injuries_indirect;
    UNSIGNED1 deaths_direct;
    UNSIGNED1 deaths_indirect;
    STRING8   damage_property;
    STRING8   damage_crops;
    STRING25  source;
    REAL4     magnitude;
    STRING2   magnitude_type;
    STRING28  flood_cause;
    UNSIGNED1 category;
    STRING3   tor_f_scale;
    REAL4     tor_length;
    REAL4     tor_width;
    STRING3   tor_other_wfo;
    STRING2   tor_other_cz_state;
    STRING3   tor_other_cz_fips;
    STRING20  tor_other_cz_name;
    UNSIGNED2 begin_range;
    STRING3   begin_azimuth;
    STRING45  begin_location;
    UNSIGNED2 end_range;
    STRING3   end_azimuth;
    STRING45  end_location;
    REAL8     begin_lat;
    REAL8     begin_lon;
    REAL8     end_lat;
    REAL8     end_lon;
    STRING15323 episode_narrative;
    STRING8942  event_narrative;
    STRING3   data_source;
END;
//Add sub files NOAA::
EXPORT File := DATASET('~FYP::main::SF::StormEvents',layout,CSV(HEADING(1)));
END;