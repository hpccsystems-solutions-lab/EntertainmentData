IMPORT $;
EXPORT File_PeopleAll := MODULE 
  EXPORT People   := DATASET('~ODSCEast::OUT::PeopleAll',$.Layouts.PeopleAll,FLAT);
  EXPORT Vehicle  := People.Vehiclerecs; //3A
  EXPORT Property := People.PropRecs;    //3C
  EXPORT Taxdata  := People.PropRecs.TaxRecs; //3B
END;