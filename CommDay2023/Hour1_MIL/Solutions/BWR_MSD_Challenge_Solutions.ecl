// #OPTION('obfuscateOutput', TRUE);
IMPORT $;
MSDMusic := $.File_Music.MSDDS;

//display the first 150 records

OUTPUT(CHOOSEN(MSDMusic, 150), NAMED('MSD_MusicDS'));

//*********************************************************************************
//*********************************************************************************

//                                CATEGORY ONE 

//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Reverse sort by "year" and count your total music dataset and display the first 50

//Result: Total count is 1000000

//Reverse sort by "year"
SortYear := SORT(MSDMusic, -year);

//display the first 50
OUTPUT(CHOOSEN(SortYear, 50), NAMED('SortYear'));

//Count and display result
OUTPUT(COUNT(SortYear), NAMED('Count_SortYear'));

//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Display first 50 songs by of year 2010 and then count the total 

//Result should have 9397 songs for 2010

//Filter for 2010 and display the first 50
Rock2010 := MSDMusic(year = 2010);
OUTPUT(CHOOSEN(Rock2010, 50), NAMED('Songs_2010'));

//Count total songs released in 2010:
CountRock2010 := COUNT(Rock2010);
OUTPUT(CountRock2010, NAMED('Total_Songs_2010'));

//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Count how many songs was produced by "Prince" in 1982

//Result should have 4 counts

//Filter ds for "Prince" AND 1982
getPrince := MSDMusic(artist_name = 'Prince' AND year = 1982);
OUTPUT(getPrince,NAMED('Prince_1982'));
//Count and print total 
OUTPUT(COUNT(getPrince), NAMED('Prince_Total'));
//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Who sang "Into Temptation"?

// Result should have 3 records

//Filter for "Into Temptation"
getTemptation := MSDMusic(Title = 'Into Temptation');

//Display result 
OUTPUT(getTemptation, NAMED ('Into_Temptation'));

//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Sort songs by Artist and song title, output the first 100

//Result: The first 10 records have no artist name, followed by "- PlusMinus (+/-)"                                     

//Sort dataset by Artist, and Title
SortingSongs := SORT(MSDMusic, artist_Name, title);

//Output the first 100
OUTPUT(CHOOSEN(SortingSongs, 100), NAMED('SortingSongs'));

//*********************************************************************************
//*********************************************************************************
//Challenge: 
//What are the hottest songs in the Million Song Dataset?
//Show Result by Year

//Result is 

//Get the Max song hotness value
maxHot := MAX(MSDMusic, song_hotness);

//Filter dataset for the MaxHot value
getMaxHot := MSDMusic(song_hotness = maxHot);

//Display the result
OUTPUT(SORT(getMaxHot(year <> 0),year), NAMED('getMaxHot'));

//*********************************************************************************
//*********************************************************************************

//                                CATEGORY TWO

//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Display all songs produced by the artist "Coldplay" AND has a 
//"Song Hotness" greater or equal to .75 ( >= .75 ) , SORT it by title.
//Count the total result

//Result has 47 records

//Get songs by defined conditions
getColdPlay := MSDMusic(Artist_name = 'Coldplay' AND song_hotness >= .75);

//Sort the result
SortgetColdPlay := SORT(getColdPlay, Title);

//Output the result
OUTPUT(SortgetColdPlay, NAMED('ColdPlay'));

//Count and output result 
OUTPUT(COUNT(SortgetColdPlay), NAMED('Count_ColdPlay'));

//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Count all songs where "Duration" is between 200 AND 250 (inclusive) 
//AND "song_hotness" is not equal to 0 
//AND familarity > .9

//Result is 762 songs  

//Hint: (SongDuration BETWEEN 200 AND 250)

//Filter for required conditions
getfamiliar := MSDMusic(Duration BETWEEN 200 AND 250, 
                        song_hotness <> 0,
                        familiarity > .9);

//Count result
Countgetfamiliar := COUNT(getfamiliar);                             

//Display result
OUTPUT(Countgetfamiliar, NAMED('CountLongFamiliar'));

//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Create a new dataset which only has "Artist", "Title", "Release" and "Year"
//Display the first 50

//Result should only have 4 columns. 

//Hint: Create your new layout and use TRANSFORM for new fields. 
//Use PROJECT, to loop through your music dataset


Song_Layout := RECORD
     STRING Title;
     STRING Artist_Name;
     STRING Release_Name;
     INTEGER Year;
END;

//Standalone Transform 
Song_Layout xform (MSDMusic Le) := TRANSFORM
    SELF := Le;
END;

//PROJECT
SingIt := PROJECT(MSDMusic,xform(LEFT));

// Display result  
OUTPUT(CHOOSEN(SingIt, 50), NAMED('SingIt'));      

//*********************************************************************************
//*********************************************************************************
//Challenge: 
//1- What’s the correlation between "song_hotness" AND "artist_hotness"
//2- What’s the correlation between "barsstartdev" AND "beatsstartdev"

//Result for hotness = 0.4706972681953097, StartDev = 0.8896342348554744

OUTPUT(CORRELATION(MSDMusic(song_hotness <> 0 AND artist_hotness <> 0), song_hotness, artist_hotness), NAMED('hotcorr'));
OUTPUT(CORRELATION(MSDMusic, barsstartdev, beatsstartdev), NAMED('StartDev'));

//*********************************************************************************
//*********************************************************************************

//                                CATEGORY THREE

//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Create a new dataset which only has following conditions
//   *  Column named "Song" that has "Title" values 
//   *  Column named "Artist" that has "artist_name" values 
//   *  New BOOLEAN Column called isPopular, and it's TRUE is IF "song_hotness" is greater than .80
//   *  New BOOLEAN Column called "IsTooLoud" which is TRUE IF "Loudness" > 0
//Display the first 50

//Result should have 4 columns named "Song", "Artist", "isPopular", and "IsTooLoud"


//Hint: Create your new layout and use TRANSFORM for new fields. 
//      Use PROJECT, to loop through your music dataset

//Creating the layout
PopLoud_Layout := RECORD
    STRING    Song;
    STRING    Artist;
    BOOLEAN   isPopular;
    BOOLEAN   isTooLoud;
END;

//Build transfrom
PopLoud_Layout PopLoud(MSDMusic Le) := TRANSFORM
    SELF.Song      := Le.Title;
    SELF.Artist    := Le.Artist_Name;
    SELF.isPopular := IF(Le.song_hotness > .5,TRUE,FALSE);
    SELF.isTooLoud := IF(Le.loudness > 0,TRUE,FALSE);
END;

//Creating project
PopLoudOut := PROJECT(MSDMusic,PopLoud(LEFT));

//Display result
OUTPUT(CHOOSEN(PopLoudOut(isPopular = TRUE AND isTooLoud = TRUE), 50), NAMED('PopLoud_Dataset'));
                       
                                              
//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Display number of songs per "Year", display the first 50 and count your total 

//Result has 2 col, Year and TotalSongs, count is 149

//Hint: All you need is a TABLE 

YearTable := TABLE(
                   MSDMusic(Year <> 0),
                       {
                           Year,
                           INTEGER TotalSongs := COUNT(GROUP) 
                       },
                       Year
                       );

//Printing the first 50 records of the result      
OUTPUT(SORT(YearTable,-TotalSongs), NAMED('CountSongs'));

//Count and display total
OUTPUT(COUNT(YearTable), NAMED('Count_YearTable'));

//*********************************************************************************
//*********************************************************************************
//What Artist had the overall hottest songs between 2006-2007?
//Calculate average "song_hotness" per "Artist_name" for "Year" 2006 and 2007

//Hint: All you need is a TABLE, and see the TOPN function for your OUTPUT 

//Output the top ten results showing two columns, Artist_Name, and HotRate.

//Filter for year
getYear := MSDMusic(Year = 2006 OR Year = 2007);

HotTable := TABLE(
                   getYear,
                       {
                           Artist_Name,
                           DECIMAL6_5 HotRate := AVE(GROUP, song_hotness)
                       },
                       Artist_name
                       );

//Display the result      
OUTPUT(TOPN(HotTable,10,-HotRate), NAMED('Hot2006_07'));

