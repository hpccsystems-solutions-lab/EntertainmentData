# HPCC Systems ECL Code Challenge

Welcome to the HPCC Systems ECL Code Challenge!
This year's challenge is "Music is Life" 

You will be introduced to big data concepts, how to process and analyze data using ECL (Enterprise Control Language). This challenge starts with an overview of ECL language and its syntax. Then  students are given a series of problems ranging  from easy to mid-level difficulty to solve. 

## Data Sources (Datasets)

For the Music is Life Challenge you have 3 music datasets to explore:

1. Spotify Top 2000
[Kaggle - Spotify](https://www.kaggle.com/iamsumat/spotify-top-2000s-mega-dataset) data is extracted from the Spotify playlist - Top 2000s on PlaylistMachinery(@plamere) using Selenium with Python.

2. The Million Song Dataset
[Million Song Dataset](http://millionsongdataset.com/)

3. The MusicMoz Open Music Project
[MusicMoz - Releases](https://musicmoz.org)
 
## Challenge 
For each of the Dataset above, there are challenge questions shown here.

Challenge Rules:
1. Make sure that your solutions are identified to the judges by workunit number and Owner. Your Owner name should be your team name (or individual name if tackling the challenge solo).
2. Pick at least one challenge from each category.

###Spotify Challenge questions
Category One (1):
Sort "TopGenre" and count your total music dataset and display the first 50.
Display first 50 songs by "garage rock" genre and then count the total.
Count how many songs was produced by "Prince" in 1984.
Who sang "Into Temptation"?
Sort songs by Artist and title, output the first 100.
Find the least Popular song using "Popularity" field

Category Two (2):
Display all games produced by "Coldplay" Artist AND has a “Popularity” greater or equal to 75 ( >= 75 ) , SORT it by title. Count the result.
Count all songs that "SongDuration" is between 200 AND 250 AND "Speechiness" is above 14. Hint: (SongDuration  > 200 AND  SongDuration < 250).
Create a new dataset which only has "Artist", "Title" and "Year", Display the first 50. Hint: Create your new layout and use TRANSFORM for new fields. Use PROJECT, to loop through your music dataset
What is the correlation between "Popularity" AND "Liveness"? What is the correlation between "Loudness" AND "Energy". 

Category Three (3):
Create a new dataset which only has following conditions:
Column named "Song" that has "Title" values
New BOOLEAN Column called isPopular, and it's TRUE is IF "Popularity" is greater than 80
New INTEGER Column called "Funkiness" which is "Loudness" + "Danceability"
Display the first 50
Hint:
Create your new layout and use TRANSFORM for new fields.
Use PROJECT, to loop through your music dataset

Display number of songs per "TopGenre", display the first 50 and count your total. Hint: All you need is a TABLE

Calculate average "Danceability" per "Artist" for "Year" 2008 Hint: All you need is a TABLE



## Resources

- [LearnECL](https://learn.hpccsystems.com/) includes ECL syntax with hands-on practices

- [ECL cheat sheet](https://github.com/hpccsystems-solutions-lab/CodeDay-Challenges/blob/main/CloudIDE-Setup.pdf) quick view of ECL syntax

- All  [HPCC and ECL](https://hpccsystems.com/training/documentation) related information


### Contact
For any questions or suggestions please contact Bob Foreman @ Robert.Foreman@lexisnexisrisk.com