IMPORT $;
MozMusic    := $.File_Music.MozDS;
MSDMusic    := $.File_Music.MSDDS;
SpotMusic   := $.File_Music.SpotDS;
SpotMillion := $.File_Music.SpotMilDS;

OUTPUT(MozMusic,NAMED('MusicMoz'));
OUTPUT(MSDMusic,NAMED('MSDMusic'));
OUTPUT(SpotMusic,NAMED('SpotMusic'));
OUTPUT(SpotMillion,NAMED('SpotMillion'));



