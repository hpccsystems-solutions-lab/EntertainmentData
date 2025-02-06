IMPORT $;
MozMusic  := $.File_Music.MozDS;
MSDMusic  := $.File_Music.MSDDS;
SpotMusic := $.File_Music.SpotDS;

// Combine the three datasets into a composite dataset using a common record format:

CombMusicLayout := RECORD
 UNSIGNED RECID;
 STRING   SongTitle;
 STRING   AlbumTitle;
 STRING   Artist;
 STRING   Genre;
 STRING4  ReleaseYear;
 STRING4  Source; //MOZ,MSD,SPOT
END;

OUTPUT('ToDo');

//After doing this, create different playlists by Year and/or genre! Music is Life! 