﻿//Import:ECLCode.BrowseInputData
IMPORT $;
MozMusic  := $.File_Music.MozDS;
MSDMusic  := $.File_Music.MSDDS;
SpotMusic := $.File_Music.SpotDS;

OUTPUT(MozMusic,NAMED('MusicMoz'));
OUTPUT(MSDMusic,NAMED('MSDMusic'));
OUTPUT(SpotMusic,NAMED('SpotMusic'));



//Import:ECLCode.BWR_BonusChallenge
IMPORT $;
MozMusic  := $.File_Music.MozDS;
MSDMusic  := $.File_Music.MSDDS;
SpotMusic := $.File_Music.SpotDS;

// Combine the three datasets into a composite dataset with a common record format

CombMusicLayout := RECORD
 UNSIGNED RECID;
 STRING   SongTitle;
 STRING   AlbumTitle;
 STRING   Artist;
 STRING4  ReleaseYear;
END;

OUTPUT('ToDo');
//Import:ECLCode.BWR_MSDChallenge
IMPORT $;
MSDMusic := $.File_Music.MSDDS;

//display the first 150 records

OUTPUT(CHOOSEN(MSDMusic, 150), NAMED('Raw_MusicDS'));

//*********************************************************************************
//*********************************************************************************

//                                CATEGORY ONE 

//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Reverse Sort by "year" and count your total music dataset and display the first 50

//Result: Total count is 1000000

//Reverse sort by "year"


//display the first 50


//Count and display result


//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Display first 50 songs by of year 2010 and then count the total 

//Result should have 9397 songs for 2010

//Filter for 2010 and display the first 50


//Count total songs released in 2010:


//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Count how many songs was produced by "Prince" in 1982

//Result should have 4 counts

//Filter ds for "Prince" AND 1982

//Count and print total 

//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Who sang "Into Temptation"?

// Result should have 3 records

//Filter for "Into Temptation"


//Display result 


//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Sort songs by Artist and song title, output the first 100

//Result: The first 10 records have no artist name, followed by "- PlusMinus"                                     

//Sort dataset by Artist, and Title


//Output the first 100


//*********************************************************************************
//*********************************************************************************
//Challenge: 
//What is the hottest song by year in the Million Song Dataset?
//Sort Result by Year (filter iut zero Year values)

//Result is 

//Get the datasets maximum hotness value


//Filter dataset for the maxHot value


//Display the result


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


//Sort the result


//Output the result


//Count and output result 


//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Count all songs where "Duration" is between 200 AND 250 (inclusive) 
//AND "song_hotness" is not equal to 0 
//AND familarity > .9

//Result is 762 songs  

//Hint: (SongDuration BETWEEN 200 AND 250)

//Filter for required conditions

//Count result
                            

//Display result


//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Create a new dataset which only has  "Title", "Artist_Name", "Release_Name" and "Year"
//Display the first 50

//Result should only have 4 columns. 

//Hint: Create your new RECORD layout and use TRANSFORM for new fields. 
//Use PROJECT, to loop through your music dataset


//Standalone Transform 

//PROJECT

// Display result  

//*********************************************************************************
//*********************************************************************************

//Challenge: 
//1- What’s the correlation between "song_hotness" AND "artist_hotness"
//2- What’s the correlation between "barsstartdev" AND "beatsstartdev"

//Result for hotness = 0.4706972681953097, StartDev = 0.8896342348554744



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

//Create the RECORD layout


//Build your TRANSFORM

//Creating the PROJECT


//Display the result

                       
                                              
//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Display number of songs per "Year" and count your total 

//Result has 2 col, Year and TotalSongs, count is 89

//Hint: All you need is a cross-tab TABLE 

//Display the  result      

//Count and display total number of years counted


//*********************************************************************************
//*********************************************************************************
// What Artist had the overall hottest songs between 2006-2007?
// Calculate average "song_hotness" per "Artist_name" for "Year" 2006 and 2007

// Hint: All you need is a TABLE, and see the TOPN function for your OUTPUT 

// Output the top ten results showing two columns, Artist_Name, and HotRate.

// Filter for year

// Create a Cross-Tab TABLE:

// Display the top ten results with top "HotRate"      

//Import:ECLCode.BWR_MusicMozChallenge
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


//Result: Total count is 136510

//*********************************************************************************
//*********************************************************************************
//Challenge: 

//Sort by "name",  and display (OUTPUT) the first 50(Hint: use CHOOSEN):

//You should see a lot of songs by NSync 



//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Count total songs in the "Rock" genre and display number:


//Result should have 12821 Rock songs

//Display your Rock songs (OUTPUT):



//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Count how many songs was released by Depeche Mode between 1980 and 1989

//Filter ds for "Depeche_Mode" AND releasedate BETWEEN 1980 and 1989

// Count and display total
//Result should have 127 songs 


//Bonus points: filter out duplicate tracks (Hint: look at DEDUP):


//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Who sang the song "My Way"?
//Filter for "My Way" tracktitle

// Result should have 136 records 

//Display count and result 


//*********************************************************************************
//*********************************************************************************
//Challenge: 
//What song(s) in the Music Moz Dataset has the longest track title in CD format?

//Get the longest description (tracktitle) field length in CD "formats"


//Filter dataset for tracktitle with the longest value


//Display the result

//Longest track title is by the "The Brand New Heavies"               


//*********************************************************************************
//*********************************************************************************

//                                CATEGORY TWO

//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Display all songs produced by "U2" , SORT it by title.

//Filter track by artist


//Sort the result by tracktitle


//Output the result


//Count result 


//Result has 190 records


//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Count all songs where guest musicians appeared 

//Hint: Think of the filter as "not blank" 

//Filter for "guestmusicians"


//Display Count result
                             

//Result should be 44588 songs  


//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Create a new recordset which only has "Track", "Release", "Artist", and "Year"
// Get the "track" value from the MusicMoz TrackTitle field
// Get the "release" value from the MusicMoz Title field
// Get the "artist" value from the MusicMoz Name field
// Get the "year" value from the MusicMoz ReleaseDate field

//Result should only have 4 fields. 

//Hint: First create your new RECORD layout  



//Next: Standalone Transform - use TRANSFORM for new fields.


//Use PROJECT, to loop through your music dataset


// Display result  
      

//*********************************************************************************
//*********************************************************************************

//                                CATEGORY THREE

//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Display number of songs per "Genre", display genre name and count for each 

//Hint: All you need is a 2 field TABLE using cross-tab

//Display the TABLE result      


//Count and display total records in TABLE


//Result has 2 fields, Genre and TotalSongs, count is 1000

//*********************************************************************************
//*********************************************************************************
//What Artist had the most releases between 2001-2010 (releasedate)?

//Hint: All you need is a cross-tab TABLE 

//Output Name, and Title Count(TitleCnt)

//Filter for year (releasedate)

//Cross-tab TABLE


//Display the result      

//Import:ECLCode.BWR_SpotifyChallenge
IMPORT $;
SpotMusic := $.File_Music.SpotDS;

//display the first 150 records

OUTPUT(CHOOSEN(SpotMusic, 150), NAMED('Raw_MusicDS'));


//*********************************************************************************
//*********************************************************************************

//                                CATEGORY ONE 

//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Sort "TopGenre" and count your total music dataset and display the first 50

//Result: Total count is 1994 

//Sort by "TopGenre"


//display the first 50


//Count and display result


//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Display first 50 songs by "garage rock" genre and then count the total 

//Result should have 4 records/counts

//Filter for garage rock and display the 50

//Count total garage rock

//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Count how many songs was produced by "Prince" in 1984

//Result should have 4 counts

//Filter ds for "Prince" AND 1984


//Count and display total 


//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Who sang "Into Temptation"?

// Result should have 1 record and the artist is "Crowded House"

//Filter for "Into Temptation"


//Display result 


//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Sort songs by Artist and title, output the first 100

//Result: First few rows should have Title and Artist as following:
//   Dreadlock Holiday          ***   10cc
//   I'm Not In Love            ***   10cc
//   The Wall Street Shuffle    ***   10cc
//   California Love            ***   2Pac


//Sort dataset by Artist, and Title


//Output the first 100


//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Find the least Popular song using "Popularity" field

//Result is "Sacrifice" by "Anouk", "Popularity" is 11

//Get the least Popularity value


//Filter dataset for the leastPop value


//Display the result


//*********************************************************************************
//*********************************************************************************

//                                CATEGORY TWO

//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Display all games produced by "Coldplay" Artist AND has a 
//"Popularity" greater or equal to 75 ( >= 75 ) , SORT it by title.
//Count the total result

//Result has 9 records

//Get songs by defined conditions


//Sort the result


//Output the result


//Count and output result 


//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Count all songs that "SongDuration" is between 200 AND 250 AND "Speechiness" is above 14 

//Result is 24

//Hint: (SongDuration > 200 AND SongDuration < 250)

//Filter for required conditions


//Count result
                             

//Display result


//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Create a new dataset which only has "Artist", "Title" and "Year"
//Display the first 50

//Result should only have 3 columns. 

//Hint: Create your new layout and use TRANSFORM for new fields. 
//Use PROJECT, to loop through your music dataset



//Create Transform 


//Create PROJECT


// Display result  
      

//*********************************************************************************
//*********************************************************************************

//Challenge: 
//1- What’s the correlation between "Popularity" AND "Liveness"
//2- What’s the correlation between "Loudness" AND "Energy"

//Result for liveness = -0.1119777784368349, Energy = 0.7357108817659003



//*********************************************************************************
//*********************************************************************************

//                                CATEGORY THREE

//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Create a new dataset which only has following conditions
//   *  Column named "Song" that has "Title" values 
//   *  New BOOLEAN Column called isPopular, and it's TRUE is IF "Popularity" is greater than 80
//   *  New INTEGER Column called "Funkiness" which is  "Loudness" + "Danceability"
//Display the first 50

//Result should have 3 columns called "Song", "isPopular", and "Funky"


//Hint: Create your new layout and use TRANSFORM for new fields. 
//      Use PROJECT, to loop through your music dataset

//Create the RECORD layout


//Build transfrom


//Create project


//Display result

                       
                                              
//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Display number of songs per "TopGenre", display the first 50 and count your total 

//Result has 2 col, TopGenre and TotalSongs, count is 149

//Hint: All you need is a TABLE 



//displaying the first 50 records of the result      


//Count and display total


//*********************************************************************************
//*********************************************************************************
//Calculate average "Danceability" per "Artist" for "Year" 2008

//Hint: All you need is a TABLE 

//Result has 40 records with two col, Artist, and DancableRate.

//Filter for year


//displaying the result      





//Import:ECLCode.CrossTabExample
MyRec := RECORD
    STRING1  Value1;
    STRING1  Value2;
    INTEGER1 Value3;
END;

SomeFile := DATASET([{'C', 'G', 1},
                     {'C', 'C', 2},
                     {'A', 'X', 3},
                     {'B', 'G', 4},
                     {'A', 'B', 5}], MyRec);

MyOutRec := RECORD
    SomeFile.Value1;
    GrpCount := COUNT(GROUP);
    GrpSum   := SUM(GROUP, SomeFile.Value3);
    AveSum   := AVE(GROUP, SomeFile.Value3);
END;

MyTable := TABLE(SomeFile, MyOutRec, Value1);

OUTPUT(MyTable);

/* MyTable result set is:
    Rec#    Value1  GrpCount    GrpSum
    1       C       2           3
    2       A       2           8
    3       B       1           4
*/

//Import:ECLCode.File_Music
/* You have 3 datasets to work with in this challenge:
   MusicMoz
   Spotify 2000
   Million Song Dataset (predecessor to Spotify)
*/
 
EXPORT File_Music := MODULE
EXPORT MozLayout := RECORD
 string45  name;
 string16  id;
 string11  rtype;
 string126 title;
 string131 genre;
 string28  releasedate;
 string2   disc;
 unsigned2 number;
 string657 tracktitle;
 string66  formats;
 string77  label;
 string107 catalognumber;
 string250 producers;
 string150 coversrc;
 string4981 guestmusicians;
 string21827 description;
END;

EXPORT MSDLayout := RECORD
    UNSIGNED4 RecID;
    STRING18  song_id;		
    STRING    title;
    UNSIGNED4 year;
    REAL      song_hotness;
    STRING18  artist_id;
    STRING375 artist_name;
    REAL      artist_hotness;
    REAL      familiarity;
    INTEGER   release_id;
    STRING    release_name;
    REAL      latitude;
    REAL      longitude;
    STRING    location;
    REAL      key;
    REAL      key_conf;
    REAL      loudness;
    INTEGER   mode;
    REAL      mode_conf;
    REAL      duration;
    REAL      start_of_fade_out;
    REAL      end_of_fade_in;
    REAL      tempo;
    REAL      time_signature;
    REAL      time_signature_conf; 
    INTEGER   CntBars;      //Bars_Analysis
    REAL      AvgBarsConf;  //Bars_Analysis   
    REAL      BarsConfDev;  //Bars_Analysis
    REAL      AvgBarsStart; //Bars_Analysis   
    REAL      BarsStartDev; //Bars_Analysis
    INTEGER   CntBeats;     //Beats_Analysis
    REAL      AvgBeatsConf; //Beats_Analysis   
    REAL      BeatsConfDev; //Beats_Analysis
    REAL      AvgBeatsStart;//Beats_Analysis   
    REAL      BeatsStartDev;//Beats_Analysis		
END;

/*
Data Source:
https://www.kaggle.com/iamsumat/spotify-top-2000s-mega-dataset

This data is extracted from the Spotify playlist - 
Top 2000s on PlaylistMachinery(@plamere) using Selenium with Python.


//********************************************************
Data dictionary
 
ID:             ID - Record Index
Title:          Name of the Track
Artist:         Name of the Artist
TopGenre:       Genre of the track
Year:           Release Year of the track.
BeatsperMinute: (BPM) The tempo of the song.
Energy:         The energy of a song - the higher the value, the more energtic song.
Danceability:   The higher the value, the easier it is to dance to this song.
Loudness:       The higher the value, the louder the song.
Valence:        The higher the value, the more positive mood for the song.
SongDuration:   The duration of the song.
Acoustic:       The higher the value the more acoustic the song is.
Speechiness:    The higher the value the more spoken words the song contains.
Popularity:     The higher the value the more popular the song is.


*/

EXPORT SpotLayout := RECORD
		INTEGER ID;
		STRING  Title;
		STRING  Artist;
		STRING  TopGenre;
		INTEGER Year;
		INTEGER BeatsPerMinute;
		DECIMAL Energy;
		DECIMAL Danceability;
		DECIMAL Loudness;
		DECIMAL Liveness;
		DECIMAL Valence;
		DECIMAL SongDuration;
		DECIMAL Acousticness;
		DECIMAL Speechiness;
		DECIMAL Popularity;    
END;
   
EXPORT MozDS  := DATASET('~MIL::IN::MozTracks',MozLayout,CSV(HEADING(1)));
EXPORT MSDDS  := DATASET('~MIL::IN::MillionSongs',MSDLayout,CSV(HEADING(1)));
EXPORT SpotDS := DATASET('~MIL::IN::Spotify2000',SpotLayout,CSV(HEADING(1)));
END;
//Import:ECLCode.FilterExample
/*
    Example code - use without restriction.  
*/
Layout_Person := RECORD
    UNSIGNED1 PersonID;
    STRING15 FirstName;
    STRING25 LastName;
END;

allPeople := DATASET([  {1, 'Fred', 'Smith'},
                        {2, 'Joe', 'Blow'},
                        {3, 'Jane', 'Smith'}], Layout_Person);

somePeople := allPeople(LastName = 'Smith');

//  Outputs  ---
somePeople;
//Import:ECLCode.Hello

//Import:ECLCode.INLINEExample
SalaryAvg_layout := RECORD
 STRING  Job;
 STRING  Category;
 STRING  City;
 STRING2 State;
 INTEGER Avg_Salary;
END;

//Inline Dataset
SalaryAvg_DS := DATASET([
                          {'Manager','IT','Atlanta','GA', 87000},
                          {'Director','Art','Atlanta','GA', 100000},
                          {'CIO','IT','Tampa','FL', 112000},
                          {'Sales','General','Chicago','IL', 55000}
                         ],SalaryAvg_Layout
                         );
//Output                         
OUTPUT(SalaryAvg_DS, NAMED('SalaryAvg_DS'));

//Choosen
OUTPUT(CHOOSEN(SalaryAvg_DS,2), NAMED('SalaryAvg_Choosen'));

//Sort
SortJobs := SORT(SalaryAvg_DS, Job);
OUTPUT(SortJobs,NAMED('SortJobs'));

//Filter
OUTPUT(SalaryAvg_DS(City = 'Tampa'), NAMED('Tampa_Filter'));


                         
                         
//Import:ECLCode.JOINExample
MyRec := RECORD
    STRING1 Value1;
    STRING1 Value2;
END;

LeftFile := DATASET([   {'C', 'A'}, 
                        {'X', 'B'}, 
                        {'A', 'C'}], MyRec);

RightFile := DATASET([  {'C', 'X'}, 
                        {'B', 'Y'}, 
                        {'A', 'Z'}], MyRec);

MyOutRec := RECORD
    STRING1 Value1;
    STRING1 LeftValue2;
    STRING1 RightValue2;
END;

MyOutRec JoinThem(MyRec L, MyRec R) := TRANSFORM
    SELF.Value1 := IF(L.Value1<>'', L.Value1, R.Value1);
    SELF.LeftValue2 := L.Value2;
    SELF.RightValue2 := R.Value2;
END;

InnerJoinedRecs := JOIN(LeftFile, RightFile, 
                        LEFT.Value1 = RIGHT.Value1, 
                        JoinThem(LEFT, RIGHT));
LOutJoinedRecs := JOIN( LeftFile, RightFile, 
                        LEFT.Value1 = RIGHT.Value1, 
                        JoinThem(LEFT, RIGHT), 
                        LEFT OUTER);
ROutJoinedRecs := JOIN( LeftFile, RightFile, 
                        LEFT.Value1 = RIGHT.Value1, 
                        JoinThem(LEFT, RIGHT), 
                        RIGHT OUTER);
FOutJoinedRecs := JOIN( LeftFile, RightFile, 
                        LEFT.Value1 = RIGHT.Value1, 
                        JoinThem(LEFT, RIGHT), 
                        FULL OUTER);
LOnlyJoinedRecs := JOIN(LeftFile, RightFile, 
                        LEFT.Value1 = RIGHT.Value1, 
                        JoinThem(LEFT, RIGHT), 
                        LEFT ONLY);
ROnlyJoinedRecs := JOIN(LeftFile, RightFile, 
                        LEFT.Value1 = RIGHT.Value1, 
                        JoinThem(LEFT, RIGHT), 
                        RIGHT ONLY);
FOnlyJoinedRecs := JOIN(LeftFile, RightFile, 
                        LEFT.Value1 = RIGHT.Value1, 
                        JoinThem(LEFT, RIGHT), 
                        FULL ONLY);

OUTPUT(InnerJoinedRecs, , NAMED('Inner'));
OUTPUT(LOutJoinedRecs, , NAMED('LeftOuter'));
OUTPUT(ROutJoinedRecs, , NAMED('RightOuter'));
OUTPUT(FOutJoinedRecs, , NAMED('FullOuter'));
OUTPUT(LOnlyJoinedRecs, , NAMED('LeftOnly'));
OUTPUT(ROnlyJoinedRecs, , NAMED('RightOnly'));
OUTPUT(FOnlyJoinedRecs, , NAMED('FullOnly'));

/* InnerJoinedRecs result set is: 
    Rec#     Value1   LeftValue2   RightValue2
    1        A        C            Z
    2        C        A            X
 
LOutJoinedRecs result set is:
    Rec#     Value1   LeftValue2   RightValue2
    1        A        C            Z
    2        C        A            X
    3        X        B            

ROutJoinedRecs result set is:
    Rec#     Value1   LeftValue2   RightValue2
    1        A        C            Z
    2        B                     Y
    3        C        A            X

FOutJoinedRecs result set is:
    Rec#     Value1   LeftValue2   RightValue2
    1        A        C            Z
    2        B                     Y    
    3        C        A            X
    4        X        B            

LOnlyJoinedRecs result set is:
    Rec#     Value1   LeftValue2   RightValue2
    1        X        B            

ROnlyJoinedRecs result set is:
    Rec#     Value1   LeftValue2   RightValue2
    1        B                     Y

FOnlyJoinedRecs result set is:
    Rec#     Value1   LeftValue2   RightValue2
    1        B                     Y
    2        X        B
*/

//Import:ECLCode.MATHExample
MathLayout := RECORD
 INTEGER Num1;
 INTEGER Num2;
 INTEGER Num3;
END;

DS := DATASET([{20,45,34},
               {909,56,45},
               {30,-1,90}],
               MathLayout);
//See slides for comments            
COUNT(DS);
MAX(DS,Num1);
MIN(DS,Num2);
AVE(DS,Num1);
SUM(DS,Num1+Num3);
TRUNCATE(AVE(DS,Num1));
ROUND(3.45);
ROUND(3.76); 

              
//Import:ECLCode.PROJECTExample
MyRec := RECORD
    STRING1 Value1;
    STRING1 Value2;
END;

SomeFile := DATASET([{'C', 'G'}, 
                     {'C', 'C'}, 
                     {'A', 'X'}, 
                     {'B', 'G'}, 
                     {'A', 'B'}], MyRec);

MyOutRec := RECORD
    myRec.Value1;
    SomeFile.Value2;
    STRING4 CatValues;
END;

MyOutRec CatThem(SomeFile L, INTEGER C) := TRANSFORM
    SELF.CatValues := L.Value1 + L.Value2 + '-' + (STRING)C;
    SELF := L;
END;

CatRecs := PROJECT(SomeFile, 
                   CatThem(LEFT, COUNTER));

OUTPUT(CatRecs);

/* CatRecs result set is:
    Rec#     Value1   Value2   CatValues
    1        C        G        CG-1
    2        C        C        CC-2
    3        A        X        AX-3
    4        B        G        BG-4
    5        A        B        AB-5
*/

