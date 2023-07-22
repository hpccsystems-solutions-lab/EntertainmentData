IMPORT $,STD;
IsWithinDays(STRING8 ldate,STRING8 rdate,INTEGER days) 
   := ABS(STD.Date.DaysBetween(STD.Date.FromStringToDate(ldate, '%Y%m%d'),
                               STD.Date.FromStringToDate(rdate, '%Y%m%d'))) <= days;
															 
Chev := 'Chevrolet';
Ford := 'Ford';
CFVehicles  := $.File_PeopleAll.Vehicle(make_description IN [Chev,Ford]);

// DedupedCars := DEDUP(CFVehicles,LEFT.Make_description = Chev AND
                                // RIGHT.Make_description = Ford AND
                                // IsWithinDays(LEFT.Purch_date,RIGHT.Purch_date,90),
                     // ALL);
                     
DedupedCars := JOIN(CFVehicles,CFVehicles, 
                    (LEFT.make_description = Ford AND RIGHT.make_description= Chev 
					          AND IsWithinDays(LEFT.Purch_date,RIGHT.Purch_date,90)),ALL);
                    
EXPORT FordChevWithin90 := IF(~EXISTS(DedupedCars),
                              -9,
                              COUNT(DedupedCars));
															
													