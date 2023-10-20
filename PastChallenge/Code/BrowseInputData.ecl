IMPORT $;
MozMusic  := $.File_Music.MozDS;
MSDMusic  := $.File_Music.MSDDS;
SpotMusic := $.File_Music.SpotDS;

OUTPUT(MozMusic,NAMED('MusicMoz'));
OUTPUT(MSDMusic,NAMED('MSDMusic'));
OUTPUT(SpotMusic,NAMED('SpotMusic'));


