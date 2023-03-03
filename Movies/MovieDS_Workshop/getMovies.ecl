EXPORT getMovies := MODULE

    EXPORT rawMovieRec := RECORD
        INTEGER ID;
        STRING  IMDB_ID;
        REAL    Popularity;
        INTEGER Budget;
        INTEGER Revenue;
        STRING   Original_Title;
        STRING   Cast;
        STRING   Homepage;
        STRING   Director;
        STRING   Tagline;
        STRING   Keywords;
        STRING   Overview;
        INTEGER  Runtime;
        STRING   Genres;
        STRING   Production_Companies;
        INTEGER  Release_Date;
        INTEGER  Vote_Count;
        REAL     Vote_Average;
        INTEGER  Release_Year;
        REAL     Budget_Adj;
        REAL     Revenue_Adj
    END;


    EXPORT MovieDS := DATASET('~tmdb::movies::data::csv', rawMovieRec, CSV(HEADING(1)));

    

END;