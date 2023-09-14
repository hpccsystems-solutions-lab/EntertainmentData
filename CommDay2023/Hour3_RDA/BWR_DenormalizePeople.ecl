IMPORT $;
 
$.Layouts.PeopleVehicles ParentMove2($.File_People.Layout Le) := TRANSFORM
  SELF.ChildVCount := 0;
  SELF.VehicleRecs := [];
  SELF := Le;
 END;
PVOnly := PROJECT($.File_People.File, ParentMove2(LEFT));

$.Layouts.PeopleVehicles ChildMove2($.Layouts.PeopleVehicles Le,
                                    $.File_Vehicle.Layout Ri,
                                    UNSIGNED1 Cnt):= TRANSFORM
  SELF.ChildVCount := Cnt;
  SELF.VehicleRecs := Le.VehicleRecs + Ri;
  SELF := Le;
END;
PVDenorm := DENORMALIZE(PVOnly, 
                        $.File_Vehicle.File,
                        LEFT.id = RIGHT.personid,
                        ChildMove2(LEFT,RIGHT,COUNTER))
                        :PERSIST('~ODSCEast::PERSIST::PeopleVehicles');
PV_DNOut := OUTPUT(PVDenorm);                        


 $.Layouts.PropTax ParentMove($.File_Property.Layout Le) := TRANSFORM
  SELF.ChildTaxCount := 0;
  SELF.TaxRecs       := [];
  SELF := Le;
 END;
 PropTaxOnly := PROJECT($.File_Property.File, ParentMove(LEFT));
 
 $.Layouts.PropTax ChildMove($.Layouts.PropTax Le, $.File_Taxdata.Layout Ri, INTEGER Cnt):=TRANSFORM
  SELF.ChildTaxCount := Cnt;
  SELF.TaxRecs       := Le.TaxRecs + Ri;
  SELF := Le;
 END;
 DenormProp := DENORMALIZE(PropTaxOnly,
                            $.File_TaxData.File,
                            LEFT.propertyid = RIGHT.propertyid,
                            ChildMove(LEFT,RIGHT,COUNTER))
                            :PERSIST('~ODSCEast::PERSIST::PropTax');
PT_DNOut := OUTPUT(DenormProp);

$.Layouts.PeopleAll ParentMove3($.Layouts.PeopleVehicles Le) := TRANSFORM
  SELF.ChildPcount := 0;
  SELF.PropRecs    := [];
  SELF := Le;
 END;
 ParentOnly := PROJECT(PVDenorm, ParentMove3(LEFT));
 
 $.Layouts.PeopleAll ChildMove3($.Layouts.PeopleAll Le, 
                                $.Layouts.Proptax Ri, 
                                INTEGER Cnt):=TRANSFORM
  SELF.ChildPcount := Cnt;
  SELF.PropRecs    := Le.PropRecs + Ri;
  SELF := Le;
 END;
 DeNorm_PeopleAll := DENORMALIZE(ParentOnly, 
                                 DenormProp,
                                 LEFT.id = RIGHT.personid,
                                 ChildMove3(LEFT,RIGHT,COUNTER));

OUTPUT(Denorm_PeopleAll,,'~ODSCEast::OUT::PeopleAll',OVERWRITE);                            
