# Challenge

For this challenge students will work with two YouTube Datasets.

Data and initial code for the challenge can be found at [CodeDay Workshop](https://ide.hpccsystems.com/workspaces/share/a0e2a8ce-64fe-4df6-b04c-a3cac8395a9e)

- rawFiles: Gives access to dataset, it's record layout, and fields information
- viewVideos: Code sample to output Canada dataset 
- When creating a new .ecl for this challenge, make sure to IMPORT rawFiles module and STD library 


# Data Dictionary

|Field|Definition|
|---|---|       
Video_ID                       | Video ID
Trending_Date                  | The day video went viral. Format: (year.day.month) Exp: 17.14.11
Title                          | Title of video
Channel_Title                  | Channel that published the video
Category_ID                    | ID of the category the video belongs to. This is a different dataset that we are not working with it
Publish_Time                   | When vide was uploaded. Format: 2017-11-15T02:17:29.000Z
Tags                           | Video's tags
Views                          | Total number of times the video was viewed
Likes                          | Total likes
Dislikes                       | Total dislikes
Comment_Count                  | Number of comment left on the video
Thumbnail_Link                 | Quick snapshot of the video 
Comments_Disabled              | Can it have comments?
Ratings_Disabled               | Can it have ratings? 
Video_Error_or_Removed         | Are the errors removed?

## Data Source

[Kaggle - YouTube](https://www.kaggle.com/datasets/datasnaek/youtube) trending YouTube videos statistics.