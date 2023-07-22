IMPORT $;
// Calculate the number of Properties with exactly 3 bedrooms in a year acquired within 5-15 years ago, or exactly 3
// bedrooms in a tax year within 5-15 years ago.
Property := $.File_PeopleAll.Property;
Taxdata  := $.File_PeopleAll.Taxdata; 
IsDateInRange(datex,lo,hi) := $.IsValidYear(datex) AND
                              $.YearsOld(datex) BETWEEN lo AND hi;
															
Prop_filter := Property.Bedrooms = 3 AND IsDateInRange(Property.Year_Acquired,5,15);
							 
Tax_filter := Taxdata.Bedrooms = 3 AND IsDateInRange(Taxdata.Tax_year,5,15);
Tax_exists := EXISTS(Taxdata(Tax_filter));

EXPORT PropTaxBedYearRange := COUNT(Property(Prop_filter OR Tax_exists));
