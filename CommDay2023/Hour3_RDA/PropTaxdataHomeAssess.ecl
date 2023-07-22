IMPORT $; //This query operates at the Parent People level
/* Calculate the assessed total value from the most recently reported Taxdata record for the most recently acquired
   Property that is not an apartment. If there are multiple properties for the same year, use the one with the highest
   property value. Output the result as an 8 character string.
*/
Property := $.File_PeopleAll.Property;
Taxdata  := $.File_PeopleAll.Taxdata;
PropYear  := IF($.IsValidYear(Property.Year_Acquired),
                              Property.Year_Acquired,
                              Property.Year_built);
PropValue := IF($.IsValidAmount(Property.Total_value),
                                Property.Total_value,
                                Property.Assessed_value);
ValidProperty := Property($.IsValidYear(PropYear),
                          $.IsValidAmount(PropValue),
                          Apt='');
SortedProperty := SORT(ValidProperty,-PropYear,-PropValue);
//**********************
ValidTaxdata   := Taxdata($.IsValidYear(Tax_year),
                          $.IsValidAmount(Assd_total_val));
															 
SortedTaxdata  := SORT(ValidTaxdata,-Tax_year);

EXPORT STRING8 PropTaxDataHomeAssess :=
                      IF(NOT EXISTS(SortedProperty),
                         '',
                         EVALUATE(SortedProperty[1],
                                  IF(NOT EXISTS(SortedTaxdata),
                                     '',
                                     (STRING8)SortedTaxdata[1].Assd_total_val)));
																	 																	 
																		 
