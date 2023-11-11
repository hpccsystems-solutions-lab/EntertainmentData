#OPTION('obfuscateOutput', TRUE);
IMPORT $;
MozMusic  := $.File_Music.MozDS;  //136508
MSDMusic  := $.File_Music.MSDDS;  //1000000
SpotMusic := $.File_Music.SpotDS; //2000

// Combine the three datasets into a composite dataset with a common record format

CombMusicLayout := RECORD
 UNSIGNED4 RECID;
 STRING    SongTitle;
 STRING    AlbumTitle;
 STRING    Artist;
 STRING4   ReleaseYear;
END;

//Step 1 - Project the largest DS to start

CombMusicLayout SlimMusic(MSDMusic Le) := TRANSFORM
 SELF.RECID       := 0;
 SELF.SongTitle   := Le.Title;
 SELF.AlbumTitle  := Le.release_name;
 SELF.Artist      := Le.artist_name;
 SELF.ReleaseYear := (STRING4)Le.year;
END;

SlimMSD := PROJECT(MSDMusic(title <> ''),SlimMusic(LEFT));

//Step 2 - Spotify 2000 Merge

CombMusicLayout SpotMerge(SpotMusic Le) := TRANSFORM
 SELF.RECID       := 0;
 SELF.SongTitle   := Le.Title;
 SELF.AlbumTitle  := '';
 SELF.Artist      := Le.artist;
 SELF.ReleaseYear := (STRING4)Le.year;
END;

SpotAdd := PROJECT(SpotMusic(title <> ''),SpotMerge(LEFT));

//Step 3 - MusicMoz Merge

CombMusicLayout MozMerge(MozMusic Le) := TRANSFORM
 SELF.RECID       := 0;
 SELF.SongTitle   := Le.TrackTitle;
 SELF.AlbumTitle  := Le.Title;
 SELF.Artist      := Le.name;
 SELF.ReleaseYear := Le.Releasedate[..4];
END;

MozAdd  := PROJECT(MozMusic(tracktitle <> ''),MozMerge(LEFT));
FinalDS := SlimMSD+SpotAdd+MozAdd;
// FinalDS(songtitle = '');
// COUNT(FinalDS);

DedSort     := SORT(FinalDS,SongTitle,Artist);
CleanCompDS := DEDUP(DedSort,SongTitle,Artist);
CompDS      := PROJECT(CleanCompDS(SongTitle[..4] NOT IN ['&lt;','&quo']),
                                   TRANSFORM(CombMusiclayout,SELF.RECID := COUNTER,SELF := LEFT));
OUTPUT(CHOOSEN(CompDS,500));
COUNT(CompDS);
