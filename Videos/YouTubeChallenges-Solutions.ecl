IMPORT YouTube.rawFiles;
IMPORT STD;

//* Display the first 10 records in the US dataset?

// Answer: Contains 10 records of US dataset

OUTPUT(CHOOSEN(rawFiles.US_DS, 10), NAMED('US_10Rows'));

//*********************************************************************************
//*********************************************************************************

// How many records are in CA dataset?

// Answer: 40881

OUTPUT(COUNT(rawFiles.CA_DS), NAMED('CA_Count'));

//*********************************************************************************
//*********************************************************************************

// How many records are in US dataset?

// Answer: 40949

OUTPUT(COUNT(rawFiles.US_DS), NAMED('US_Count'));

//*********************************************************************************
//*********************************************************************************

// How many records in CA dataset don't have any tags assigned?

// Answer: 2385

NoTags := COUNT(rawFiles.CA_DS(Tags = ''));

OUTPUT(NoTags, NAMED('CA_NoTags'));

//*********************************************************************************
//*********************************************************************************

// Between CA and US datasets which one has the most releases in 2018?

// Answer: CA

US2018 := COUNT(rawFiles.US_DS(Publish_Time[..4] = '2018'));
CA2018 := COUNT(rawFiles.CA_DS(Publish_Time[..4] = '2018'));

OUTPUT(IF(US2018 >= CA2018, 'US', 'CA'), NAMED('Most_Release2018'));


//*********************************************************************************
//*********************************************************************************

/*
 Number of total records in both US and CA datasets that have the title 
        A Very Cool Christmas - Movie Review - brutalmoose
*/

// Answer is: 1

Str := 'A Very Cool Christmas - Movie Review - brutalmoose';

OUTPUT(COUNT(rawFiles.US_DS(Title = Str)) + 
       COUNT(rawFiles.CA_DS(Title = Str)),
       NAMED('Total_Title_Count'));

//*********************************************************************************
//*********************************************************************************

// How many records in US dataset have both Comment and Rating disabled?

// Answer is: 106

Disabled := rawFiles.US_DS(Comments_Disabled AND Ratings_Disabled);

OUTPUT(COUNT(Disabled), NAMED('Disabled'));

//*********************************************************************************
//*********************************************************************************

// How many records in US dataset have more Dislikes than Likes?

// Answer: 576

Dislike := rawFiles.US_DS(Dislikes > Likes);

OUTPUT(COUNT(Dislike), NAMED('More_Dislikes'));

//*********************************************************************************
//*********************************************************************************

/*
In CA dataset are there any records that have Comments_Disabled set to true, 
but have Comments?
*/

// Answer: No

isWrongEntry := rawFiles.CA_DS(Comments_Disabled AND
                               Comment_Count > 0);

OUTPUT(IF(EXISTS(isWrongEntry), 'Yes', 'No'), NAMED('isWrongEntry'));
                      ;
//*********************************************************************************
//*********************************************************************************

// In US dataset are there any records that the total of Dislikes and Likes are equal to Views count?

// Answer: No

isEqual := rawFiles.US_DS(Dislikes + Likes = Views);

OUTPUT(EXISTS(isEqual), NAMED('isEqual'));

//*********************************************************************************
//*********************************************************************************

/*
In CA dataset, How many records have minimum number of Likes?

Note: we are not interested in equal ones.
*/


// Answer: 284

MinLikes := MIN( rawFiles.CA_DS, Likes);
LittleLikes := rawFiles.CA_DS(MinLikes = Likes);


OUTPUT(COUNT(LittleLikes), NAMED('LittleLikes'));


//*********************************************************************************
//*********************************************************************************

/* 
In CA dataset, Publish_Time includes date and time (2017-11-13T17:13:01.000Z). 
We want to separate date and time for better readability and future processing, 
and we want to convert the  date format to mm/dd/yyyy. 
Create a new dataset that includes 4 fields: 

  Video_ID, Title, PublishedDate and PublishedTime
       •   ECL standard library has a ConvertDateFormat() function that can be used to reformat date:   
       •   STRING ConvertDateFormat(STRING date_text, VARSTRING from_format='%m/%d/%Y', VARSTRING to_format='%Y%m%d') 
       •   https://github.com/hpcc-systems/HPCC-Platform/blob/master/ecllibrary/std/Date.ecl
       •   Name your new dataset NewDS and output the first 25 records. 
       •   The result dataset should look like following:



Video_ID     | Title                | PublishedDate | PublishedTime
CpU72eM8vCo  | Operation: Dry Tank  | 11/13/2017    | 07:13:54

*/

// Answer : Result should contain 25 records with above format.

NewRec := RECORD
    STRING    Video_ID;
    STRING    Title;
    STRING10  PublishedDate;
    STRING8   PublishedTime;
END;

NewDS := PROJECT(rawfiles.CA_DS, 
            TRANSFORM(newRec,
                SELF.PublishedDate := STD.Date.ConvertDateFormat(LEFT.Publish_Time[..12], '%Y-%m-%d', '%m/%d/%Y');
                SELF.PublishedTime := (STRING) LEFT.Publish_Time[12..19];
                SELF := LEFT));

OUTPUT(CHOOSEN(NewDS, 25), NAMED('FormattingDate_Time'));

//*********************************************************************************
//*********************************************************************************

/*
How many videos have the most tags in US?

   •  In ECL CountWords function is used to count the number of words using a separator
   •  STD.Str.CountWords(source, separator)
   •  https://hpccsystems.com/training/documentation/standard-libraryreference/html/CountWords.html
   •  Note: Keep in mind, that a video can be trended in more than one day, which will result in duplicated Video_ID and Title.
*/

// Answer:  2

TagRec := RECORD
    STRING    Video_ID;
    STRING    Title;
    INTEGER   TagCount;
END;

MostTags := PROJECT(rawfiles.US_DS,
                TRANSFORM(TagRec,
                    SELF.TagCount := STD.STR.CountWords(LEFT.Tags, '|'),
                    SELF := LEFT)); 


GetMax := MAX(MostTags, TagCount);                
MaxTag := DEDUP(MostTags(TagCount = GetMax), Video_ID, Title);

OUTPUT(MaxTag, nAMED('MaxTag'));

//*********************************************************************************
//*********************************************************************************


/*
In CA dataset how many records have the same dates (day, month, year) for Publish_Time and Trending_Date?

Note: Keep in mind that Publish_Time and Trending_Date do not have the same format. 
For comparison you need the exact same format on both fields. 
*/

// Answer is: 	2042

TrendDate     := STD.Date.ConvertDateFormat(rawFiles.CA_DS.Trending_Date, '%Y.%d.%m', '%m/%d/%Y');
PublishedDate := STD.Date.ConvertDateFormat(rawFiles.CA_DS.Publish_Time[3..12], '%Y-%m-%d', '%m/%d/%Y');

SameDates := COUNT(rawFiles.CA_DS (TrendDate = PublishedDate));

OUTPUT(SameDates, NAMED('Have_Same_Dates'));


//*********************************************************************************
//*********************************************************************************


/*
Now we want to know "total releases per year" in US. 
Using the NewDS dataset you just created, or finding another solution, 
show number of releases per year.  Looking at the result, 
how many years is included in this dataset?
*/

// Answer: 12 

TotalReleases := TABLE(rawFiles.US_DS,
                       {
                        STRING  Year := Publish_Time[..4],
                        INTEGER Total := COUNT(GROUP)
                       },
                           Publish_Time[..4]);

OUTPUT(TotalReleases, NAMED('TotalReleases'));

//*********************************************************************************
//*********************************************************************************

// From "total releases per year" for US, what is the minimum release total and what year it belongs to?

// Answer: 1 and 2006

MinReleases := MIN(TotalReleases, Total);

OUTPUT(TotalReleases(Total = MinReleases), NAMED('Min_Year'));

//*********************************************************************************
//*********************************************************************************

// From "total releases per year" for US, what is the maximum release total and what year it belongs to?

// Answer: 30231 and 2018

MaxReleases := MAX(TotalReleases, Total);

OUTPUT(TotalReleases(Total = MaxReleases), NAMED('Max_Year'));

//*********************************************************************************
//*********************************************************************************

// Find the number of videos that went viral on the same Trending_Date in both US and CA.

// Answer: 4790

Viral := COUNT(
            JOIN(
                rawFiles.US_DS, rawFiles.CA_DS,
                    LEFT.Video_ID = RIGHT.Video_ID AND
                    LEFT.Trending_Date = RIGHT.Trending_Date,
                    TRANSFORM(LEFT)));


OUTPUT(Viral, NAMED('US_CA_Viral'));

//*********************************************************************************
//*********************************************************************************

// Which Channel_Title released the most videos in year 2017 in CA?

// Answer: 	VikatanTV

GetYear := rawFiles.CA_DS(Publish_Time[1..4] = '2017');


TitleCount := TABLE(GetYear,
                       {
                        Channel_Title,
                        INTEGER Total := COUNT(GROUP)
                       },
                           Channel_Title);

MaxCount := MAX(TitleCount, Total);

OUTPUT(TitleCount(MaxCount = Total), NAMED('TitleCount'));


//*********************************************************************************
//*********************************************************************************
/*
How many videos have different Channel_Title between US and CA. 

Note: Since we are looking at videos, remember to eliminate duplicates. 
*/

// Answer: 8

DiffChannel := DEDUP(
                    JOIN(
                        rawFiles.US_DS, rawFiles.CA_DS,
                            LEFT.Video_ID = RIGHT.Video_ID AND
                            LEFT.Channel_Title  != RIGHT.Channel_Title,
                            TRANSFORM(LEFT)),
                    Video_ID);

OUTPUT(COUNT(DiffChannel), NAMED('DiffChannel'));

