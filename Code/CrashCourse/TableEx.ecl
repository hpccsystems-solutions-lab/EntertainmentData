Pickup_layout := RECORD
  STRING10   pickup_date;
  DECIMAL8_2 fare;
  DECIMAL8_2 distance;
END;

Pickup_DS := DATASET([
                     {'2015-01-01',25.10,5},
                     {'2015-01-01',40.15,8},
                     {'2015-01-02',30.10,6},
                     {'2015-01-02',25.15,4}
                     ], Pickup_Layout);

crossTabLayout := RECORD
  Pickup_DS.pickup_date;
  avgFare := AVE(GROUP,Pickup_DS.fare);
  totFare := SUM(GROUP,Pickup_DS.fare);
END;

crossTabDS := TABLE(Pickup_DS, // Input Dataset
                    crossTabLayout,
                    pickup_date);

OUTPUT(crossTabDS, NAMED('crossTabs'));                    