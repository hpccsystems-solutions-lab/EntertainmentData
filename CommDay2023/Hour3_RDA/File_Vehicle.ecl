EXPORT File_Vehicle := MODULE
EXPORT Layout := RECORD
   UNSIGNED8 personid;
   STRING2   orig_state;
   UNSIGNED2 year_make;
   STRING5   make_code;
   STRING4   vehicle_type;
   STRING3   model;
   STRING5   body_code;
   STRING1   vehicle_use;
   STRING3   major_color_code;
   STRING3   minor_color_code;
   UNSIGNED2 model_year;
   STRING3   vina_series;
   STRING3   vina_model;
   STRING2   vina_body_style;
   STRING36  make_description;
   STRING36  model_description;
   STRING25  body_style_description;
   STRING2   number_of_cylinders;
   STRING4   engine_size;
   STRING1   fuel_code;
   UNSIGNED4 vina_price;
   STRING1   history;
   STRING5   best_make_code;
   STRING3   best_series_code;
   STRING3   best_model_code;
   STRING5   best_body_code;
   UNSIGNED2 best_model_year;
   STRING3   best_major_color_code;
   STRING3   best_minor_color_code;
   STRING8   purch_date;
  END;
EXPORT File := DATASET('~ODSCEast::vehicle',Layout,THOR);

END;
