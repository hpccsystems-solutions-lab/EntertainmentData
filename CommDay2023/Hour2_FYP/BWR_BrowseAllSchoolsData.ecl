IMPORT $;
Schools := $.File_AllSchools.File;
OUTPUT(Schools,NAMED('AllSchools'));

OUTPUT(COUNT(Schools),NAMED('Cnt_AllSchools'));

OUTPUT(SORT(Schools,name),NAMED('Sort_ByName'));



