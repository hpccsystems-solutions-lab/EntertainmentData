IMPORT $,STD;
Characters := $.Characters;
RecOut := RECORD
INTEGER FilmCount;
INTEGER VehicleCount;
INTEGER ShipCount;
$.Layout_Characters;
END;


RecOut CountStuff(Characters Le) := TRANSFORM
 SELF.FilmCount    := STD.STR.CountWords(Le.films,',',true);
 SELF.VehicleCount := STD.STR.CountWords(Le.vehicles,',',true);
 SELF.ShipCount    := STD.STR.CountWords(Le.starships,',',true);
 SELF := Le;
END;

Analyze := PROJECT(Characters,CountStuff(LEFT));

OUTPUT(SORT(Analyze,-FilmCount),NAMED('MostFilms'));
OUTPUT(SORT(Analyze,-VehicleCount),NAMED('MostVehicles'));
OUTPUT(SORT(Analyze,-ShipCount),NAMED('MostShips'));


