IMPORT $;
// Calculate the number of unique vehicles owned, based on their make code. If no vehicles exist, output a -9 value.

SortedVehicles := SORT($.File_PeopleAll.Vehicle,Make_code);
DedupVehicles  := DEDUP(SortedVehicles,Make_code);
EXPORT CountUniqueMakeVehicles := IF(~EXISTS(DedupVehicles),
                                     -9,
                                     COUNT(DedupVehicles));
