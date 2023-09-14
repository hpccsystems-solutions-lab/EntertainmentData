IMPORT $;
//Restore parent record (people) 
ParentOut := PROJECT($.File_PeopleAll.People, $.File_People.Layout);

//Extract Vehicle information: 
ReNormedVRecs := PROJECT($.File_PeopleAll.Vehicle,$.File_Vehicle.Layout);

//Extract Property information:
ReNormedPRecs := PROJECT($.File_PeopleAll.Property,$.File_Property.Layout);

//Extract Taxdata information:
ReNormedTRecs := PROJECT($.File_PeopleAll.Taxdata,$.File_Taxdata.Layout);


OUTPUT(ParentOut);
OUTPUT(ReNormedVRecs);
OUTPUT(ReNormedPRecs);
OUTPUT(ReNormedTRecs);
