IMPORT $;

//FIRST: Restore parent record (People) 
ParentOut := PROJECT($.File_PeopleAll.People, $.File_People.Layout);
OUTPUT(ParentOut,NAMED('People'));

//Vehicle Next:
VOut := NORMALIZE($.File_PeopleAll.People,LEFT.VehicleRecs,TRANSFORM(RIGHT));
OUTPUT(VOut,NAMED('Vehicle'));

//Property
POut := NORMALIZE($.File_PeopleAll.People,LEFT.PropRecs,TRANSFORM($.File_Property.Layout,SELF := RIGHT));
OUTPUT(POut,NAMED('Property'));

//Finally, TaxData:
TOut := NORMALIZE($.File_PeopleAll.Property,LEFT.TaxRecs,TRANSFORM(RIGHT));
OUTPUT(TOut,NAMED('Taxdata'));