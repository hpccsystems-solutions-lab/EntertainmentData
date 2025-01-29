IMPORT $;
MozMusic    := $.File_Music.MozDS;
MSDMusic    := $.File_Music.MSDDS;
SpotMillion := $.File_Music.SpotDS;

OUTPUT(MozMusic,NAMED('MusicMoz'));
OUTPUT(MSDMusic,NAMED('MSDMusic'));
OUTPUT(SpotMillion,NAMED('SpotMillion'));



