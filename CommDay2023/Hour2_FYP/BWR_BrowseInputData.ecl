IMPORT $;
OUTPUT($.File_PublicSchools.File,NAMED('PublicSchools'));
OUTPUT(COUNT($.File_PublicSchools.File),NAMED('Cnt_Public'));

OUTPUT($.File_PrivateSchools.File,NAMED('PrivateSchools'));
OUTPUT(COUNT($.File_PrivateSchools.File),NAMED('CntPrivate'));

OUTPUT($.File_Crimes.File,NAMED('Crimes'));
OUTPUT(COUNT($.File_Crimes.File),NAMED('Cnt_AllCrimes'));

OUTPUT($.File_Crimes.File2,NAMED('VCrimes'));
OUTPUT(COUNT($.File_Crimes.File2),NAMED('Cnt_VCrimes'));

OUTPUT($.File_Mortality.File,NAMED('Mortality'));
OUTPUT(COUNT($.File_Mortality.File),NAMED('Cnt_Mortality'));

OUTPUT($.File_Mortality.File2,NAMED('Mortality_ByState'));
OUTPUT(COUNT($.File_Mortality.File2),NAMED('Cnt_Mortality_By_State'));

OUTPUT($.File_Weather.File,NAMED('Storms'));
OUTPUT(COUNT($.File_Weather.File),NAMED('Cnt_Storms'));

OUTPUT($.File_StateFIPS.File,NAMED('FIPSLookup'));
OUTPUT(COUNT($.File_StateFIPS.File),NAMED('Cnt_FIPS'));



