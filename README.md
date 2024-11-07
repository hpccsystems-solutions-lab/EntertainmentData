# HPCC Systems ECL Code Challenge

Welcome to the HPCC Systems "Music is Life" ECL Code Challenge!

The goal of this challenge is to introduce you to big data concepts and best industry practices, including how to process and analyze data using ECL (Enterprise Control Language) in the LexisNexis HPCC Systems platform.

This challenge starts with an overview of ECL language and its syntax. You will be given a series of questions ranging from easy to mid-level difficulty to solve. 

## Data Sources (Datasets)

For the Music is Life Challenge you have 3 large music datasets to explore:

1. Spotify Songs
[Kaggle - Spotify](https://www.kaggle.com/datasets/amitanshjoshi/spotify-1million-tracks) This dataset was extracted from the Spotify platform using the Python library "Spotipy", which allows users to access music data provided via APIs. The dataset collected includes about 1 Million tracks with 19 features between 2000 and 2023. Also, there is a total of 61,445 unique artists and 82 genres in the data.

2. The Million Song Dataset
[Million Song Dataset](http://millionsongdataset.com/)

3. The MusicMoz Open Music Project
[MusicMoz - Releases](https://musicmoz.org)

4. Spotify Update
[Kaggle - Spotify](https://www.kaggle.com/iamsumat/spotify-top-2000s-mega-dataset) data is extracted from the Spotify playlist - Top 2000s on PlaylistMachinery(@plamere) using Selenium with Python.

 
## Challenge 
For each of the Dataset above, there are challenge questions shown here.

Challenge Rules:
1. Make sure that your solutions are identified to the judges by workunit number and Owner. Your Owner name should be your team name (or individual name if tackling the challenge solo).
2. Pick at least one challenge from each category. More credit will be given for completing more categories.

**MusicMoz Challenge questions**

*Category One (MM1):*

(A) Count the total records in the dataset.

(B) Sort MusicMoz by "name" and display (OUTPUT) the first 50 records(Hint: use CHOOSEN)

(C) Display the first 50 songs by "Rock" genre and then count the total

(D) How many songs were released by Depeche Mode between 1980 and 1989?

(E) How many artists sang the song "My Way"? Display all songs and the total count.

(F) What song(s) in the Music Moz Dataset have the longest "description"?

*Category Two (MM2):*

(A) How many songs were produced by "U2"? , SORT result by song title, and also display the total count in a separate output. 

(B) Count and display all songs where "guest musicians" appeared.

(C) Create a new dataset which only has "TrackTitle", "Title", "Name", and "ReleaseDate"

- Rename the columns to Track, Release, Artist, and Year respectively

- Display the first 50 

*Category Three (MM3):*

(A) Display the number of songs grouped by "Genre", display the first 50 and count your total genres. 

(B) What Artist had the most releases between 2001-2010 (releasedate)?

**Million Song Dataset Challenge questions**

*Category One (MS1):*

(A)Reverse sort your dataset by "year", count the total number of records and display only the first 50

(B)Count the total number of songs released in 2010 and display the first 50 results

(C)How many songs were produced by "Prince" in 1982? 

(D)Who sang "Into Temptation?"

(E)Sort songs by Artist and Song Title, and output the first 100

(F)What are the hottest songs by year in the Million Song Dataset? 

- Exclude songs with no year value

- Get the datasets' maximum song_hotness value and use it in your output filter. 

*Category Two (MS2):*

(A)Display all songs produced by the artist "Coldplay" that have a "Song Hotness" greater or equal to .75 ( >= .75 )

- SORT the output by title.

- Also, output the count of the total result

(B)Count all songs whose "Duration" is between 200 AND 250 (inclusive) AND "song_hotness" is not equal to 0 AND "familarity" > .9

(C)Create a new dataset which only has the "Title", "Artist_Name", "Release_Name" and "Year" information.

(D)Calculate Correlation:

- between "song_hotness" AND "artist_hotness"

- between "barsstartdev" AND "beatsstartdev"
 
*Category Three (MS3):*

(A)Create a new dataset which only has following conditions

- Column named "Song" that has "Title" values 

- Column named "Artist" that has "artist_name" values 

- New BOOLEAN Column called isPopular, and it's TRUE is IF "song_hotness" is greater than .80

- New BOOLEAN Column called "IsTooLoud" which is TRUE IF "Loudness" > 0

- Display the first 50

- Result should have 4 columns named "Song", "Artist", "isPopular", and "IsTooLoud"

(B)Display number of songs per "Year" and count total songs released per year 

- Result has 2 fields, Year and TotalSongs, verify count is 89

(C)What Artist had the overall hottest songs between 2006-2007?

- Calculate the average "song_hotness" per "Artist_name" for "Year" 2006 and 2007

**Spotify Challenge questions**

*Category One (SP1):*

(A)	Sort "TopGenre" and count your total music dataset and display the first 50.

(B) Display first 50 songs by "garage rock" genre and then count the total.

(C) Count how many songs were produced by "Prince" in 1984.

(D) Who sang "Into Temptation"?

(E) Sort songs by Artist and title, output the first 100.

(F) Find the least Popular song using "Popularity" field

*Category Two (SP2):*

(A) Display all songs produced by "Coldplay" Artist AND with a “Popularity” greater or equal to 75 ( >= 75 ) , SORT it by title. Count the result.

(B) Count all songs where "SongDuration" is between 200 AND 250 AND "Speechiness" is above 14. Hint: (SongDuration  > 200 AND  SongDuration < 250).

(C) Create a new dataset which only has "Artist", "Title" and "Year", Display the first 50. Hint: Create your new layout and use TRANSFORM for new fields. Use PROJECT, to loop through your music dataset

(D) What is the correlation between "Popularity" AND "Liveness"? What is the correlation between "Loudness" AND "Energy"?

*Category Three (SP3):*

(A) Create a new dataset which only has following conditions:
- Column named "Song" that has "Title" values
	
- New BOOLEAN Column called isPopular, and it's TRUE IF "Popularity" is greater than 80
	
- New INTEGER Column called "Funkiness" which is "Loudness" + "Danceability"
	
- Display the first 50
	
- Hint: Create your new layout and use TRANSFORM for new fields. Use PROJECT, to loop through your music dataset

(B) Display number of songs per "TopGenre", display the first 50 and count your total. Hint: All you need is a TABLE

(C) Calculate average "Danceability" per "Artist" for "Year" 2008 Hint: All you need is a TABLE

**Bonus Challenge**

Combine the above 3 datasets into a composite dataset with the following format:

`CombMusicLayout := RECORD`

 `UNSIGNED RECID;`

 `STRING   SongTitle;`

 `STRING   AlbumTitle;`

 `STRING   Artist;`

 `STRING4  ReleaseYear;`
 
 `END;`

Remove any duplicate songs, sequence the song records and count the new total.


## Tools

Start by installing one or both of the following IDEs: 

Install the flagship ECL IDE if you are a Windows user [ECL IDE Install](https://hpccsystems.com/download/#h-bare-metal-non-containerized-platform).

If you have a Mac or Linux box, install the Visual Studio Code IDE for your appropriate O/S, and then refer to the Installation PDF in the Docs folder of this repository to configure your IDE for ECL usage.  
PDFs in the Docs folder of this repository can be found to guide you through the installation and configuration.

[VS-Code IDE Install Page](https://code.visualstudio.com/download).

If you need more information on the ECL jobs you are running please use [ECL Watch Page](http://challenge.us-hpccsystems-dev.azure.lnrsg.io:8010/)

**Note: This cluster will only be active during the event!** After the event, you can create your own localized container cluster, or visit our public "Play" Cluster: (https://play.hpccsystems.com:18010) 

For a quick start on ECL syntax, please visit the [Learn ECL](https://solutionslab.hpccsystems.com/learn-ecl/introduction/) page. 

## Additional Resources

- Full ECL documentation:
https://cdn.hpccsystems.com/releases/CE-Candidate-9.8.36/docs/EN_US/ECLLanguageReference_EN_US-9.8.36-1.pdf

- Visualization document
https://cdn.hpccsystems.com/releases/CE-Candidate-9.8.36/docs/EN_US/VisualizingECL_EN_US-9.8.36-1.pdf

- Standard Library
https://cdn.hpccsystems.com/releases/CE-Candidate-9.8.36/docs/EN_US/ECLStandardLibraryReference_EN_US-9.8.36-1.pdf

- Machine Learning
https://hpccsystems.com/download/free-modules/machine-learning-library


## Challenge Expectation

Judges will consider followings during final presentation:

- Problem that was chosen (What categories and datasets were selected)
- How many challenge questions were answered by your team?
- Any additional insights into the data you were exploring?


## Tips for a Great Score

- Since your solution is the key part to this challenge you can use "#OPTION('obfuscateOutput', TRUE);" at the start of your code to hide it from being viewed on ECL Watchpage. If you decide to use #OPTION make sure to remove if from the WUID that you shared with the judges. When obfuscateOutput set to true, details are removed from the generated workunit, including ECL code, estimates of record size, and number of records.
- If you want to write the result to a file, make sure the file name starts with your team's name for uniqueness purpose.
- Make sure the query names are unique and easy to identify. Do not use generic names like test, mentors, or roxie. We suggest adding your team's name as well. General names will result in other teams overwriting your files, queries, and results

## Mentors

<div class="mentors">

<div>
<img src="./Images/Bob.png" alt="Bob Foreman" width="100" height="100" />
<p><a href = "mailto: robert.foreman@lexisnexisrisk.com">Bob Foreman</a> has been an ECL Trainer for the past 12 years, and has been a Technology Teacher for longer than he wants to admit. He will be your primary onsite contact regarding all ECL related questions during this event.</p>
</div>

<div>
<img src="./Images/Hugo.jpg" alt="Hugo Watanuki" width="100" />
<p><a href = "mailto: hugo.watanuki@lexisnexisrisk.com">Hugo Watanuki</a> is responsible for the HPCC Systems Summer Internship Program. He will be available online in our slack channel to help you with ECL questions and resources you might need during this event.</p>
</div>

<div>
<img src="./Images/George.png" alt="George Foreman" width="100" />
<p><a href = "mailto: george.foreman@lexisnexisrisk.com">George Foreman</a> is our HPCC Systems Product Specialist and Technical Writer. He will be available onsite to help you with locating the resources you need during this event.</p>
</div>

### Contact
For any questions or suggestions please contact Bob Foreman @ Robert.Foreman@lexisnexisrisk.com
