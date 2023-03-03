IMPORT getMovies;
IMPORT STD;


//*********************************************************************************
//*********************************************************************************
//      Welcome to movie challenge questions.

// All results should be shown via ECL code not Built-in IDE features
//*********************************************************************************
//*********************************************************************************


//Print the first 10 rows 
//Answer will have 10 rows of the movie dataset

OUTPUT(CHOOSEN(getMovies.MovieDS, 10), NAMED('TenRows'));

//*********************************************************************************
//*********************************************************************************

//How many rows are in the movie dataset?
//Answer is: 10866

OUTPUT(COUNT(getMovies.MovieDS), NAMED('Total_Movies'));

//*********************************************************************************
//*********************************************************************************

//How many movies have been directed by 'Alan Taylor'?
//Answer is: 2

OUTPUT(COUNT(getMovies.MovieDS(Director = 'Alan Taylor')), NAMED('Count_AlanTaylor'));


//*********************************************************************************
//*********************************************************************************

//How many movies have been directed by 'Tom McCarthy' with Vote_Average over 7
//Answer is: 2

getTom := getMovies.MovieDS(Director = 'Tom McCarthy' AND Vote_Average > 7);
OUTPUT(COUNT(getTom), NAMED('getTom'));

//*********************************************************************************
//*********************************************************************************

//How many movies have 0 Budget
//Answer is: 5696

getBudget := getMovies.MovieDS(Budget = 0);
OUTPUT(COUNT(getBudget), NAMED('getBudget'));

//*********************************************************************************
//*********************************************************************************

//Do we have any movies released in 2017, 2018 or 2019
//Answer is: No
isRelease := getMovies.MovieDS(Release_Year IN [2017, 2018, 2019]);
OUTPUT(COUNT(isRelease), NAMED('isRelease'));

//*********************************************************************************
//*********************************************************************************

//Get the Max value for Vote_Average and count how many rows have the same value
//Answer is: 1

getMaxVote := MAX(getMovies.MovieDS, Vote_Average);
countMaxPop := COUNT(getMovies.MovieDS(Vote_Average = getMaxVote));
OUTPUT(countMaxPop, NAMED('countMaxPop'));

//*********************************************************************************
//*********************************************************************************

//What is the average Runtime
//Answer is: 102.0708632431437

getAvgRumtime := AVE(getMovies.MovieDS, Runtime);
OUTPUT(getAvgRumtime, NAMED('getAvgRumtime'));

//*********************************************************************************
//*********************************************************************************

//What is the correlation between Budget and Revenue
//Answer is: 0.734900681907618

OUTPUT(CORRELATION(getMovies.MovieDS, Budget, Revenue), NAMED('isCorrelated'));

//*********************************************************************************
//*********************************************************************************

//How many movies have no Director and no tagline
//Answer is: 34

noDir := getMovies.MovieDS(Director = '' AND Tagline = '');
OUTPUT(COUNT(noDir), NAMED('noDir'));


//*********************************************************************************
//*********************************************************************************

//Release_Date field is formatted day/month/year.
//Break this field into 3 separate fields: Day, Month, and Year. 
//Display the result along with Original_Title and Director field.
//The new dataset should have 5 fields total:
//Original_Title, Director, Day, Month, Year
//Hint: IMPORT std;
//Then you can use: STD.Date.Day(Date), STD.Date.Month(Date), and STD.Date.Year(Date)
//Display the first 100 rows

//Answer will create a new dataset with 5 columns and 100 rows

NewRec := RECORD
    STRING Original_Title;
    STRING Director;
    INTEGER Day;
    INTEGER Month;
    INTEGER Year;
END;

BrokenYearDS := PROJECT(getMovies.MovieDS,
                    TRANSFORM(NewRec,
                            SELF.Day   := STD.Date.Day(LEFT.Release_Date),
                            SELF.Month := STD.Date.Month(LEFT.Release_Date),
                            SELF.Year  := STD.Date.Year(LEFT.Release_Date),
                            SELF := LEFT));

OUTPUT(CHOOSEN(BrokenYearDS, 100), NAMED('BrokenYearDS'));

//*********************************************************************************
//*********************************************************************************

//View the number of movies created per year
//Count and output your total result

//Result is : 56 

year_movies_count := TABLE(getMovies.MovieDS,
                                {
                                    Release_Year,                                    
                                    INTEGER Total := COUNT(GROUP),
                                },
                                Release_Year);

OUTPUT(COUNT(year_movies_count), NAMED('year_movies_count'));

//*********************************************************************************
//*********************************************************************************

//Calculate the average Popularity per Artist for year 2015
//Display how many rows are in the result dataset

//Result is : 629

Filter2015 := getMovies.MovieDS(Release_year = 2015);

AvgPop := TABLE(
                   Filter2015,
                       {
                           Director,
                           REAL DancableRate := AVE(GROUP, Popularity),
                       },
                       Director, Popularity
                       );

//Printing the result      
OUTPUT(COUNT(AvgPop), NAMED('AvgPop'));


//*********************************************************************************
//*********************************************************************************

//Create a new dataset which only shows the following field which exact name:
//Tile, Director, Year and Revenue
//Show the first 50 rows

//Answer should include 50 rows and 4 columns

newRec2 := RECORD
    STRING  Title;
    STRING  Director;
    INTEGER Year;
    INTEGER Revenue;
END;

newDS := PROJECT(getMovies.MovieDS,
                    TRANSFORM(
                        newRec2,
                        SELF.Title := LEFT.Original_Title;
                        SELF.Year  := LEFT.Release_Year;
                        SELF := LEFT));

OUTPUT(CHOOSEN(newDS, 50), NAMED('newDS'));

//*********************************************************************************
//*********************************************************************************
//Create a new dataset with following fields and display the first 100
//1- Movie: Name of the movie
//2- TimeLine : If RunTime is less than 60 min, it should say 'Too Short', 
//              60 t0 120: 'Just Right', over 120min 'Too Long'
//3- IsExp: If budget is more than 100,000,000 it's True, else False
//4- VoteInfo: Vote_Count + _ +  Vote_Average

//Answer should include 50 rows and 4 columns

newRec3 := RECORD
    STRING  Movie;
    STRING  TimeLine;
    BOOLEAN IsExp;
    STRING  VoteInfo;
END;

newDS3 := PROJECT(getMovies.MovieDS,
                    TRANSFORM(newRec3,
                        SELF.TimeLine := MAP(LEFT.RunTime < 60  => 'Too Short',
                                             LEFT.RunTime < 120 => 'Just Right',
                                             'Too Long');
                        SELF.IsExp := LEFT.Budget <= 100000000;
                        SELF.VoteInfo := LEFT.Vote_Count + '_' + LEFT.Vote_Average;
                        SELF.Movie := LEFT.Original_Title;
                    ));

OUTPUT(CHOOSEN(newDS3, 100), NAMED('newDS3'));
