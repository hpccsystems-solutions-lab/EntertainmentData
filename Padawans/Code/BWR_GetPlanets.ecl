IMPORT $;
Characters  := $.Characters;
Char_Layout := $.Layout_Characters;

// Get Planets

// Step 1: Build a table of planets:
PlanetTable := TABLE(Characters,{homeworld});
OUTPUT(PlanetTable,NAMED('PlanetTable'));

SortPlanets := SORT(PlanetTable,homeworld);
OUTPUT(SortPlanets,NAMED('SortPlanets'));

//Remove Duplicates
Planets := DEDUP(SortPlanets,homeworld);

OUTPUT(Planets,NAMED('UniquePlanets'));

// Planets := DEDUP(SORT(TABLE(Characters,{homeworld}),homeworld),homeworld);