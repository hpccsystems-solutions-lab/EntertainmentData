EXPORT rawFiles := MODULE

    EXPORT YouTube_Rec := RECORD
        STRING   Video_ID;                       // Common id field to both comment and video csv files
        STRING8  Trending_Date;                  // The day video went viral. Format: (year.day.month) 17.14.11
        STRING   Title;                          // Title of video
        STRING   Channel_Title;                  // Channel that published the video
        INTEGER  Category_ID;                    // ID of the category the video belongs to
        STRING   Publish_Time;                   // When vide was uploaded. Format: 2017-11-15T02:17:29.000Z
        STRING   Tags;                           // Separated by | character, [none] is displayed if there are no tags
        INTEGER  Views;                          // Total number of times that video was viewed
        INTEGER  Likes;                          // Total likes
        INTEGER  Dislikes;                       // Total dislikes
        INTEGER  Comment_Count;                  // Number of comment left on the video
        STRING   Thumbnail_Link;                 // Quick snapshot of your video while browsing YouTube.
        BOOLEAN  Comments_Disabled;              // Can it have comments?
        BOOLEAN  Ratings_Disabled;               // Can it have ratings? 
        BOOLEAN  Video_Error_or_Removed;         // Are the erros removed?
    END;
    
    // US YouTube Dataset
    US_DS_Raw := DATASET('~youtub::raw::us::csv', YouTube_Rec, 
                              CSV(HEADING(1)));
    EXPORT US_DS := DEDUP(SORT(US_DS_Raw, record), record);

    // Canada YouTube Dataset
    EXPORT CA_DS := DATASET('~youtub::raw::canada::csv', YouTube_Rec, 
                              CSV(HEADING(1)));

END;