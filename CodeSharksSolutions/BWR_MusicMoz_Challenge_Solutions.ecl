#OPTION('obfuscateOutput', TRUE);
IMPORT $;
MozMusic := $.File_Music.MozDS;

//display the first 150 records

OUTPUT(CHOOSEN(MozMusic, 150), NAMED('Moz_MusicDS'));

//*********************************************************************************
//*********************************************************************************

//                                CATEGORY ONE 

//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Count all the records in the dataset:
OUTPUT(COUNT(MozMusic),NAMED('TotalRecs'));

//Result: Total count is 136510

//Sort by "name",  and display (OUTPUT) the first 50 (Hint: use CHOOSEN).
SortName := SORT(MozMusic,Name);
OUTPUT(CHOOSEN(SortName, 50), NAMED('NameSort'));
//A lot of songs by NSync 

// DISTRIBUTION(MozMusic,genre);

//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Count total songs in the "Rock" genre and display number:

Rock      := MozMusic(Genre = 'Rock');
CountRock := COUNT(Rock);
OUTPUT(CountRock, NAMED('Total_Rock'));
//Result should have 12821 Rock songs

//Display your Rock songs (OUTPUT):

OUTPUT(Rock, NAMED('Rock_Genre'));

//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Count how many songs was released by Depeche Mode between 1980 and 1989

//Filter ds for "Depeche_Mode" AND releasedate BETWEEN 1980 and 1989
getDM := MozMusic(name = 'Depeche_Mode' AND ReleaseDate BETWEEN '1980' AND '1989');

OUTPUT(getDM,NAMED('DM80s'));
// Count and print total
//Result should have 127 songs 
OUTPUT(COUNT(getDM), NAMED('DM_Total'));
sortTitle := SORT(getDM,trackTitle);

//Extra points: filter out duplicate tracks
OUTPUT(DEDUP(sortTitle,tracktitle),{STRING40 title := tracktitle},NAMED('DM_Unique'));

//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Who sang the song "My Way"?

// Result should have 136 records by multiple artists  

//Filter for "My Way"
getMyWay := MozMusic(tracktitle = 'My Way');

//Display result 
OUTPUT(getMyWay, NAMED ('My_Way'));
OUTPUT(COUNT(getMyWay), NAMED ('Cnt_MyWay'));

//*********************************************************************************
//*********************************************************************************
//Challenge: 
//What song(s) in the Music Moz Dataset has the longest track title in CD format?

//Result is 

//Get the Max description field length
maxtitle    := MAX(MozMusic(formats = 'CD'), LENGTH(TRIM(tracktitle)));

//Filter dataset for the Maxdesc value
getMaxtitle := MozMusic(LENGTH(TRIM(tracktitle)) = maxtitle);

//Display the result
OUTPUT(getMaxtitle, NAMED('getMaxtitle'));
//Longest track title by the "Brand_New_Heavies,_The"                       
               
//*********************************************************************************
//*********************************************************************************

//                                CATEGORY TWO

//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Display all songs produced by "U2" , SORT it by title.

//Filter track by artist
getU2 := MozMusic(Name = 'U2');

//Sort the result by tracktitle
SortgetU2 := SORT(getU2, tracktitle);

//Output the result
OUTPUT(SortgetU2, NAMED('U2Songs'));

//Count result 
OUTPUT(COUNT(SortgetU2), NAMED('Count_U2'));

//Result has 190 records


//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Count all songs where guest musicians appeared 

//Result is 44588 songs  

//Hint: Think of the filter as "not blank" 

//Filter for required conditions
getguests := MozMusic(guestmusicians <> ''); 

//Count result
Countgetguests := COUNT(getguests);                             

//Display result
OUTPUT(Countgetguests, NAMED('CountGuests'));

//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Create a new dataset which only has "TrackTitle", "Name", "Title", and "ReleaseDate"
//Display the first 50

//Result should only have 4 columns. 

//Hint: Create your new layout and use TRANSFORM for new fields. 
//Use PROJECT, to loop through your music dataset


Song_Layout := RECORD
     STRING Track;
     STRING Release;
     STRING Artist;
     INTEGER Year;
END;

//Standalone Transform 
Song_Layout xform (MOZMusic Le) := TRANSFORM
    SELF.Track   := Le.TrackTitle;
    SELF.Release := Le.Title;
    SELF.Artist  := Le.Name;
    SELF.Year    := (INTEGER)Le.ReleaseDate;
END;

//PROJECT
SlimSongs := PROJECT(MozMusic,xform(LEFT));

// Display result  
OUTPUT(SlimSongs, NAMED('SlimSongs'));      

//*********************************************************************************
//*********************************************************************************

//                                CATEGORY THREE

//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Display number of songs per "Genre", display and count your total 

//Result has 2 fields, Genre and TotalSongs, count is 1000

//Hint: All you need is a TABLE 

GenreTable := TABLE(
                   MOZMusic,
                       {
                           Genre,
                           INTEGER TotalSongs := COUNT(GROUP) 
                       },
                       Genre
                       );

//Display the result      
OUTPUT(GenreTable, NAMED('GenreList'));

//Count total records
OUTPUT(COUNT(GenreTable), NAMED('Count_Genre'));

//*********************************************************************************
//*********************************************************************************
//What Artist had the most releases between 2001-2010 (releasedate)?

//Hint: All you need is a cross-tab TABLE 

//Output Name, and Title Count(TitleCnt)

//Filter for year
getYear      := MOZMusic(ReleaseDate[..4] BETWEEN '2001' AND '2010');
UniqueTitles := SORT(MOZMusic,Name,Title);
DedupTitles  := DEDUP(UniqueTitles,Name,Title);
// deduptitles(name='Presley,_Elvis'); //See why Elvis was the winner!

ArtistRel := TABLE(
                   DedupTitles,
                       {
                           Name,
                           TitleCnt := COUNT(GROUP)
                       },
                       Name
                       );

//Display the result      
OUTPUT(SORT(ArtistRel,-TitleCnt), NAMED('ArtistRel'));