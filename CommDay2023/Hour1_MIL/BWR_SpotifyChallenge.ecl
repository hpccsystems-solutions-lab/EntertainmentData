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




