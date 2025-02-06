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
//Sort songs by genre and count the number of songs in your total music dataset 

 

//Sort by "genre" (See SORT function)


//Display them: (See OUTPUT)


//Count and display result (See COUNT)
//Result: Total count is 1159764:


//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Display songs by "garage" genre and then count the total 
//Filter for garage genre and OUTPUT them:


//Count total garage songs
//Result should have 17123 records:


//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Count how many songs was produced by "Prince" in 2001

//Filter ds for 'Prince' AND 2001


//Count and output total - should be 35 



//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Who sang "Temptation to Exist"?

// Result should have 1 record and the artist is "New York Dolls"

//Filter for "Temptation to Exist" (name is case sensitive)

//Display result 


//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Output songs sorted by Artist_name and track_name, respectively

//Result: First few rows should have Artist and Track as follows:
// !!! 	Californiyeah                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
// !!! 	Couldn't Have Known                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
// !!! 	Dancing Is The Best Revenge                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
// !!! 	Dear Can   
// (Yes, there is a valid artist named "!!!")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          


//Sort dataset by Artist_name, and track_name:


//Output here:



//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Find the MOST Popular song using "Popularity" field

//Get the most Popular value (Hint: use MAX)


//Filter dataset for the mostPop value


//Display the result - should be "Flowers" by Miley Cyrus



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
//Count all songs that whose "SongDuration" (duration_ms) is between 200000 AND 250000 AND "Speechiness" is above .75 
//Hint: (Duration_ms BETWEEN 200000 AND 250000)

//Filter for required conditions
                          

//Count result (should be 2153):

//Display result:

//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Create a new dataset which only has "Artist", "Title" and "Year"
//Output them

//Result should only have 3 columns. 

//Hint: Create your new layout and use TRANSFORM for new fields. 
//Use PROJECT, to loop through your music dataset

//Define RECORD here:

//Standalone TRANSFORM Here 

//PROJECT here:

//OUTPUT your PROJECT here:
      

//*********************************************************************************
//*********************************************************************************

//COORELATION Challenge: 
//1- What’s the correlation between "Popularity" AND "Liveness"
//2- What’s the correlation between "Loudness" AND "Energy"

//Result for liveness = -0.05696845812100079, Energy = -0.03441566150625201



//*********************************************************************************
//*********************************************************************************

//                                CATEGORY THREE

//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Create a new dataset which only has following conditions
//   *  STRING Column(field) named "Song" that has "Track_Name" values
//   *  STRING Column(field) named "Artist" that has "Artist_name" values
//   *  New BOOLEAN Column called isPopular, and it's TRUE is IF "Popularity" is greater than 80
//   *  New DECIMAL3_2 Column called "Funkiness" which is  "Energy" + "Danceability"
//Display the output

//Result should have 4 columns called "Song", "Artist", "isPopular", and "Funkiness"


//Hint: Create your new layout and use TRANSFORM for new fields. 
//      Use PROJECT, to loop through your music dataset

//Define the RECORD layout


//Build TRANSFORM


//Project here:


//Display result here:


                       
                                              
//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Display number of songs for each "Genre", output and count your total 

//Result has 2 col, Genre and TotalSongs, count is 82

//Hint: All you need is a TABLE - this is a CrossTab report 

//Printing the first 50 records of the result      

//Count and display total - there should be 82 unique genres

//Bonus: What is the top genre?

//*********************************************************************************
//*********************************************************************************
//Calculate the average "Danceability" per "Artist" for "Year" 2023

//Hint: All you need is a TABLE 

//Result has 37600 records with two col, Artist, and DancableRate.

//Filter for year 2023

//OUTPUT the result    




