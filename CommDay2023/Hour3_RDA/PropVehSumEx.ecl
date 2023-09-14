IMPORT $;
Vehicle  := $.File_PeopleAll.Vehicle;
Property := $.File_PeopleAll.Property;
SetPassengerCarCodes := ['ALPASS','CTPASS','DEPASS','FLAU','IDCAR',
                         'MDPASS','MN09','MOP','MS1','MTPC','NEP',
                         'OHPC','OKPASS','ORPASS','SCPASS','WIAUTO'];
CatCodes := Vehicle.Orig_state + Vehicle.Vehicle_type;
CarCount := COUNT(Vehicle(CatCodes IN SetPassengerCarCodes,
                          $.IsValidAmount(Vina_price),
                          Vina_price > 15000,
                          $.IsValidYear(Year_make),
                          $.YearsOld(Year_make) <= 3));
PropCount := COUNT(Property(Apt = '',
                            $.IsValidAmount(Total_value),
                            Total_value > 150000,
                            $.IsValidYear(Year_built),
                            $.YearsOld(Year_built) <= 10));
													
// EXPORT PropVehSumEx := $.Limit_Value(CarCount + PropCount, 5);
EXPORT PropVehSumEx := CarCount + PropCount;
