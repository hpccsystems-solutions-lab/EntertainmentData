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


//display the first 50


//Count and display result


//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Display first 50 songs by "Alternative Rock" genre and then count the total 

//Result should have 2384 records/counts

//Filter for Alternative Rock and print the 50


//Count total alternative rock:


//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Count how many songs was releaseded by "Sting" in 1985?

//Result should have 10 songs

//Filter dataset for "Sting" AND '1985'

//Count and print total 


//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Who sang "Yesterday"?

// Result should have 49 records by multiple artists  

//Filter for "Yesterday"


//Display and count result 


//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Sort songs by Artist and song title, output the first 100

//Result: You should see *N_Sync as the first artist                                     

//Sort dataset by Artist, and Title


//Output the first 100


//*********************************************************************************
//*********************************************************************************
//Challenge: 
//What song(s) in the Music Moz Dataset had the longest description?

//Result is REO Speedwagon (The Second Decade of Rock and Roll 1981 to 1991)

//Get the Max description field length


//Filter dataset for the Maxdesc value


//Display the result


//*********************************************************************************
//*********************************************************************************

//                                CATEGORY TWO

//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Display all songs produced by "Coldplay" , SORT it by song title.
//Count the total result

//Result has 63 records

//Get songs by defined conditions


//Sort the result


//Output the result


//Count and output result 


//*********************************************************************************
//*********************************************************************************
//Challenge: 
//Count all songs where guest musicians appeared 

//Result is 44588 songs  

//Hint: Think of the filter as "not blank" 

//Filter for required conditions

//Count result
                             

//Display result


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


//PROJECT

// Display result  
      

//*********************************************************************************
//*********************************************************************************

//                                CATEGORY THREE

//*********************************************************************************
//*********************************************************************************

//Challenge: 
//Display number of songs per "Genre", display the first 50 and count your total 

//Result has 2 col, Genre and TotalSongs, count is 1000

//Hint: All you need is a TABLE 


//Printing the first 50 records of the result      


//Count and display total


//*********************************************************************************
//*********************************************************************************
//What Artist had the most releases between 2001-2010 (releasedate)?

//Hint: All you need is a cross-tab TABLE 

//Output Name, and Title Count(TitleCnt)

//Filter for year

// deduptitles(name='Presley,_Elvis'); //See why Elvis was the winner!

//Display the result      
