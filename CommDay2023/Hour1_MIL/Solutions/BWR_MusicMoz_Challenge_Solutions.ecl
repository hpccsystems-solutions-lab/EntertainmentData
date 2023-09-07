// #OPTION('obfuscateOutput', TRUE);
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
//Sort "genre" and count your total music dataset and display the first 50

//Result: Total count is 136510

//Sort by "genre"
SortGenre := SORT(MozMusic, genre);

//display the first 50
OUTPUT(CHOOSEN(SortGenre(genre <> ''), 200), NAMED('SortGenre'));

//Count and display result
OUTPUT(COUNT(SortGenre), NAMED('Cnt_All'));
OUTPUT(COUNT(SortGenre(genre='')), NAMED('Cnt_BlankGenre'));

//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Display first 50 songs by "alternative rock" genre and then count the total 

//Result should have 2384 records/counts

//Filter for Alternative Rock and display the 50
AltRock := MozMusic(Genre = 'Alternative Rock');
OUTPUT(CHOOSEN(AltRock, 50), NAMED('AltRock_Genre'));

//Count total alternative rock
CountAltRock := COUNT(AltRock);
OUTPUT(CountAltRock, NAMED('Total_AltRock'));

//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Count how many songs was releaseded by "Sting" in 1985

//Result should have 10 songs

//Filter ds for "Sting" AND 1985
getSting := MozMusic(name = 'Sting' AND releasedate = '1985');
OUTPUT(getSting,NAMED('Sting1985'));
//Count and print total 
OUTPUT(COUNT(getSting), NAMED('Sting_Total'));

//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Who sang "Yesterday"?

// Result should have 49 records by multiple artists  

//Filter for "Yesterday"
getYesterday := MozMusic(tracktitle = 'Yesterday');

//Display result 
OUTPUT(getYesterday, NAMED ('Yesterday'));
OUTPUT(COUNT(getYesterday), NAMED ('Cnt_Yesterday'));

//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Sort songs by Artist and title, output the first 100

//Result: You should see *N_Sync as the first artist                                     

//Sort dataset by Artist, and Title
SortingSongs := SORT(MozMusic, Name, TrackTitle);

//Output the first 100
OUTPUT(CHOOSEN(SortingSongs, 100), NAMED('SortingSongs'));

//*********************************************************************************
//*********************************************************************************
//Challenge: 
//What song(s) in the Music Moz Dataset had the longest description?

//Result is REO Speedwagon (The Second Decade of Rock and Roll 1981 to 1991)

//Get the Max description field length
maxdesc := MAX(MozMusic, LENGTH(TRIM(description)));

//Filter dataset for the Maxdesc value
getMaxdesc := MozMusic(maxdesc = LENGTH(TRIM(description)));

//Display the result
OUTPUT(getMaxdesc, NAMED('getMaxdesc'));

//*********************************************************************************
//*********************************************************************************

//                                CATEGORY TWO

//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Display all songs produced by "Coldplay" , SORT it by title.
//Count the total result

//Result has 63 records

//Get songs by defined conditions
getColdPlay := MozMusic(Name = 'Coldplay');

//Sort the result
SortgetColdPlay := SORT(getColdPlay, tracktitle);

//Output the result
OUTPUT(SortgetColdPlay, NAMED('ColdPlay'));

//Count and output result 
OUTPUT(COUNT(SortgetColdPlay), NAMED('Count_ColdPlay'));

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
SingIt := PROJECT(MozMusic,xform(LEFT));

// Display result  
OUTPUT(CHOOSEN(SingIt, 50), NAMED('SingIt'));      

//*********************************************************************************
//*********************************************************************************

//                                CATEGORY THREE

//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Display number of songs per "Genre", display the first 50 and count your total 

//Result has 2 col, Genre and TotalSongs, count is 1000

//Hint: All you need is a TABLE 

GenreTable := TABLE(
                   MOZMusic,
                       {
                           Genre,
                           INTEGER TotalSongs := COUNT(GROUP) 
                       },
                       Genre
                       );

//Printing the first 50 records of the result      
OUTPUT(CHOOSEN(GenreTable, 50), NAMED('countSongs'));

//Count and display total
OUTPUT(COUNT(GenreTable), NAMED('Count_GenreTable'));

//*********************************************************************************
//*********************************************************************************
//What Artist had the most releases between 2001-2010 (releasedate)?

//Hint: All you need is a cross-tab TABLE 

//Output Name, and Title Count(TitleCnt)

//Filter for year
getYear := MOZMusic(ReleaseDate[..4] BETWEEN '2001' AND '2010');
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