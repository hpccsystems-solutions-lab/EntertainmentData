IMPORT $;
People   := $.File_PeopleAll.People;
Vehicles := $.File_PeopleAll.Vehicle;
Property := $.File_PeopleAll.Property;
// OUTPUT(People,{$.PropValSmallStreet,People});
//4D, 4F, 4G, 4H
OUTPUT(People,{$.PropValSmallStreet,
               $.VehicleNewTruckPrice,
               $.PropTaxDataHomeAssess,
               $.CountUniqueMakeVehicles,
               People});

//4H Alt
OUTPUT(COUNT(People(NOT EXISTS(Vehicles))),NAMED('NoVehicles'));				 
OUTPUT(COUNT(People(EXISTS(Vehicles))),NAMED('OwnVehicles'));

OUTPUT(COUNT(People(NOT EXISTS(Property))),NAMED('NoHome'));				 
OUTPUT(COUNT(People(EXISTS(Property))),NAMED('OwnHome'));


				 
				 
