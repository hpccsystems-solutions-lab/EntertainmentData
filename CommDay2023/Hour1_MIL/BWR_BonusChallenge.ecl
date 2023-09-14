IMPORT $;
MozMusic  := $.File_Music.MozDS;
MSDMusic  := $.File_Music.MSDDS;
SpotMusic := $.File_Music.SpotDS;

// Combine the three datasets into a composite dataset with a common record format
// Remove any duplicate songs and songs with blank titles, sequence the remaining song records and count the new total.
// There should be 1010083 combined and cleaned records. 

CombMusicLayout := RECORD
 UNSIGNED RECID;
 STRING   SongTitle;
 STRING   AlbumTitle;
 STRING   Artist;
 STRING4  ReleaseYear;
END;

OUTPUT('ToDo');