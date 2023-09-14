IMPORT $;
// Calculate the price of the newest truck and output it as a 6 character string.
// A "truck" is defined as: a vehicle type code of: 4, T, TK, TR, TRK, or TRUK.
Vehicle  := $.File_PeopleAll.Vehicle;
IsTruck  := Vehicle.Vehicle_type IN ['4','T','TK','TR','TRK','TRUK'];
BestYear := IF($.IsValidyear(Vehicle.Model_Year),
                             Vehicle.Model_Year,
                             Vehicle.Best_Model_Year);
Trucks   := Vehicle(IsTruck,
                    $.IsValidyear(BestYear),
                    $.IsValidAmount(Vina_price));
SortedTrucks := SORT(Trucks,-BestYear,-Vina_price);
EXPORT STRING6 VehicleNewTruckPrice := IF(NOT EXISTS(SortedTrucks),
                                          '',
                                          (STRING6) SortedTrucks[1].Vina_price);
