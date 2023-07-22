IMPORT $,STD;

Complete := $.File_MusicMoz.File;
Layout   := $.File_MusicMoz.ArtistRecord;
Layout2  := $.File_MusicMoz.Layout2;
// FlatLay  := $.File_MozItems.FlatLay;
// Release := $.File_MozItems.MozItemsDS;


Layout ParseArtists(Complete Le) := TRANSFORM
FirstSlash  := STD.STR.Find(Le.Name,'/',2);
SecondSlash := STD.STR.Find(Le.Name,'/',3);
SELF.Name   := Le.Name[FirstSlash+1..SecondSlash-1];
SELF        := Le; 
END;

Result := PROJECT(Complete(EXISTS(Items(rtype='release'))),ParseArtists(LEFT));
OUTPUT(Result,NAMED('ExtractRelease'),NOXPATH);
//Clean original data to only show releases
OUTPUT(Result(name <> '' AND EXISTS(Items(rtype = 'release'))),,'~MIL::CleanedReleasesDemo',NAMED('THOROut'),OVERWRITE,NOXPATH);
ArtistRelDS := DATASET('~MIL::CleanedReleasesDemo',layout2,THOR);
//Layout2 strips XPATH info from RECORD

OUTPUT(ArtistRelDS(name[..7]='Beatles'),NAMED('ArtistFilter'));
// OUTPUT(ArtistRelDS(name='2nd_Chapter_of_Acts'),NAMED('ArtistFilter'));

//Process THOR file now:
//Normalize Items Test:
OUTPUT(ArtistRelDS.Items,{ArtistRelDS.Name,ArtistRelDS.Items},'~MIL::ItemsNormalizedTest1',OVERWRITE);

//Now flatten (normalize) the tracks
// OUTPUT(ArtistRelDS.Items.Tracks,{ArtistRelDS.Name,ArtistRelDS.Items,ArtistRelDS.Items.Tracks},'~MIL::TracksNormalizedTest1',OVERWRITE);
OUTPUT(ArtistRelDS.Items.Tracks,{ArtistRelDS.Name,
                                 ArtistRelDS.Items.rtype,
                                 ArtistRelDS.Items.title,
                                 ArtistRelDS.Items.genre,
                                 ArtistRelDS.Items.releaseDate,
                                 ArtistRelDS.Items.formats,
                                 ArtistRelDS.Items.Tracks});

// FlatLay FlatTrack(Release Le,INTEGER Cnt) := TRANSFORM
// SELF.disc       := Le.Tracks[Cnt].disc;
// SELF.number     := (UNSIGNED2)Le.Tracks[Cnt].number;
// SELF.tracktitle := Le.Tracks[Cnt].tracktitle;
// SELF := Le;
// END;

// FlatTracks := NORMALIZE(Release,LEFT.Tracks,FlatTrack(LEFT,COUNTER));

// OUTPUT(FlatTracks,,'~MIL::MozTracksNew',OVERWRITE);

// FlatTracks(STD.Str.Contains(name,'Elvis',true));
// OUTPUT(SORT(FlatTracks(name='Presley,_Elvis'),title),,'MIL::ElvisSongs',OVERWRITE);
// Black,_Cilla
// Presley,_Elvis
// OUTPUT(FlatTracks(name='Black,_Cilla',title = 'Cilla The Best of 1963-1978'));
