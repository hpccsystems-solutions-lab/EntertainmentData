EXPORT Layouts := MODULE
EXPORT PeopleVehicles := RECORD
  $.File_People.Layout;
  UNSIGNED1 ChildVCount;
  DATASET($.File_Vehicle.Layout) VehicleRecs{MAXCOUNT(20)};
 END;

EXPORT PropTax := RECORD
  $.File_Property.Layout;
  UNSIGNED1 ChildTaxCount;
  DATASET($.File_Taxdata.Layout) TaxRecs{MAXCOUNT(20)};
END;

EXPORT PeopleAll := RECORD
  $.File_People.Layout; 
  UNSIGNED1 ChildVcount;
  UNSIGNED1 ChildPcount;
  DATASET($.File_Vehicle.Layout) VehicleRecs{MAXCOUNT(20)};
  DATASET(PropTax) PropRecs{MAXCOUNT(20)};
 END;
END;