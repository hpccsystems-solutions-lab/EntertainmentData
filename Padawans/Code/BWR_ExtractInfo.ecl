IMPORT $;
Characters  := $.Characters;
Char_Layout := $.Layout_Characters;

// Extract a list of Vehicles, Starships, and Planets.

// Get Planets

Planets := DEDUP(SORT(TABLE(Characters,{homeworld}),homeworld),homeworld);
OUTPUT(Planets);