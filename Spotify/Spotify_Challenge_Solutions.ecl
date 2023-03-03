
IMPORT getMusic;

//print the first 150 records

OUTPUT(CHOOSEN(getMusic.SpotifyDS, 150), NAMED('Raw_MusicDS'));

//*********************************************************************************
//*********************************************************************************

//                                CATEGORY ONE 

//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Sort "TopGenre" and count your total music dataset and display the first 50

//Result: Total count is 1994

//Sort by "TopGenre"
SortTopGenre := SORT(getMusic.SpotifyDS, TopGenre);

//display the first 50
OUTPUT(CHOOSEN(SortTopGenre, 50), NAMED('SortTopGenre'));

//Count and display result
OUTPUT(COUNT(SortTopGenre), NAMED('Count_SortTopGenre'));

//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Display first 50 songs by "garage rock" genre and then count the total 

//Result should have 4 records/counts

//Filter for garage rock and print the 50
garageRock := getMusic.SpotifyDS(TopGenre = 'garage rock');
OUTPUT(CHOOSEN(garageRock, 50), NAMED('garageRock_Genre'));

//Count total garage rock
CountGarageRock := COUNT(garageRock);
OUTPUT(CountGarageRock, NAMED('Total_GarageRock'));

//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Count how many songs was produced by "Prince" in 1984

//Result should have 4 counts

//Filter ds for "Prince" AND 1984
getPrince := getMusic.SpotifyDS(artist = 'Prince' AND year = 1984);

//Count and print total 
OUTPUT(COUNT(getPrince), NAMED('Prince_Total'));

//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Who sang "Into Temptation"?

// Result should have 1 record and the artist is "Crowded House"

//Filter for "Into Temptation"
getTemptation := getMusic.SpotifyDS(Title = 'Into Temptation');

//Display result 
OUTPUT(getTemptation, NAMED ('Into_Temptation'));

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
SortingSongs := SORT(getMusic.SpotifyDS, Artist, Title);

//Output the first 100
OUTPUT(CHOOSEN(SortingSongs, 100), NAMED('SortingSongs'));

//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Find the least Popular song using "Popularity" field

//Result is "Sacrifice" by "Anouk", "Popularity" is 11

//Get the least Popularity value
leastPop := MIN(getMusic.SpotifyDS, Popularity);

//Filter dataset for the leastPop value
getLeastPop := getMusic.SpotifyDS (leastPop = Popularity);

//Display the result
OUTPUT(getLeastPop, NAMED('getLeastPop'));

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
getColdPlay := getMusic.SpotifyDS(Artist = 'Coldplay' AND
                                  Popularity >= 75);

//Sort the result
SortgetColdPlay := SORT(getColdPlay, Title);

//Output the result
OUTPUT(SortgetColdPlay, NAMED('ColdPlay'));

//Count and output result 
OUTPUT(COUNT(SortgetColdPlay), NAMED('Count_ColdPlay'));

//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Count all songs that "SongDuration" is between 200 AND 250 AND "Speechiness" is above 14 

//Result is 24

//Hin: (SongDuration > 200 AND SongDuration < 250)

//Filter for required conditions
getLenSpeech := getMusic.SpotifyDS(SongDuration > 200 AND 
                                   SongDuration < 250 AND
                                   Speechiness > 14);

//Count result
CountgetLenSpeech  := COUNT(getLenSpeech);                             

//Display result
OUTPUT(CountgetLenSpeech, NAMED('CountgetLenSpeech'));

//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Create a new dataset which only has "Artist", "Title" and "Year"
//Display the first 50

//Result should only have 3 columns. 

//Hint: Create your new layout and use TRANSFORM for new fields. 
//Use PROJECT, to loop through your music dataset


Song_Layout := RECORD
     STRING Artist;
     STRING Title;
     INTEGER Year;
END;

//Standalone Transform 
Song_Layout xform (getMusic.Spotify_Layout Li) := TRANSFORM
    SELF := Li;
END;

//PROJECT
SingIt := PROJECT(getMusic.SpotifyDS,
                     xform(LEFT));

// Display result  
OUTPUT(CHOOSEN(SingIt, 50), NAMED('SingIt'));      

//*********************************************************************************
//*********************************************************************************

//Challenge: 
//1- What’s the correlation between "Popularity" AND "Liveness"
//2- What’s the correlation between "Loudness" AND "Energy"

//Result for liveness = -0.1119777784368349, Energy = 0.7357108817659003

OUTPUT(CORRELATION(getMusic.SpotifyDS, Popularity, Liveness), NAMED('Liveness'));
OUTPUT(CORRELATION(getMusic.SpotifyDS, Energy,     Loudness), NAMED('Energy'));

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

//Creating the layout
Funky_Layout := RECORD
    STRING    Song;
    BOOLEAN   isPopular;
    INTEGER   Funkiness;
END;

//Build transfrom
Funky_Layout xFunk (getMusic.Spotify_Layout Fi) := TRANSFORM

    SELF.Song := Fi.Title;
    SELF.isPopular := IF(Fi.Popularity > 80,
                             TRUE,
                             FALSE);
    SELF.Funkiness := Fi.Loudness + Fi.Danceability;

END;

//Creating project
makeFunky := PROJECT(getMusic.SpotifyDS,
                       xFunk(LEFT));

//Display result
OUTPUT(CHOOSEN(makeFunky, 50), NAMED('Funkinees_Dataset'));
                       
                                              
//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Display number of songs per "TopGenre", display the first 50 and count your total 

//Result has 2 col, TopGenre and TotalSongs, count is 149

//Hint: All you need is a TABLE 

GenreTable := TABLE(
                   getMusic.SpotifyDS,
                       {
                           TopGenre,
                           INTEGER TotalSongs := COUNT(GROUP) 
                       },
                       TopGenre
                       );

//Printing the first 50 records of the result      
OUTPUT(CHOOSEN(GenreTable, 50), NAMED('countSongs'));

//Count and display total
OUTPUT(COUNT(GenreTable), NAMED('Count_GenreTable'));

//*********************************************************************************
//*********************************************************************************
//Calculate average "Danceability" per "Artist" for "Year" 2008

//Hint: All you need is a TABLE 

//Result has 40 records with two col, Artist, and DancableRate.

//Filter for year
getYear := getMusic.SpotifyDS(Year = 2008);

DanceTable := TABLE(
                   getYear,
                       {
                           Artist,
                           INTEGER DancableRate := AVE(GROUP, Danceability)
                       },
                       Danceability, Artist
                       );

//Printing the result      
OUTPUT(DanceTable, NAMED('Danceability'));



