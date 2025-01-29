/* You have 3 datasets to work with in this challenge:
   MusicMoz
   Million Song Dataset (predecessor to Spotify)
   Spotify Million
*/
 
EXPORT File_Music := MODULE
EXPORT MozLayout := RECORD
 string45  name;
 string16  id;
 string11  rtype;
 string126 title;
 string131 genre;
 string28  releasedate;
 string2   disc;
 unsigned2 number;
 string657 tracktitle;
 string66  formats;
 string77  label;
 string107 catalognumber;
 string250 producers;
 string150 coversrc;
 string4981 guestmusicians;
 string21827 description;
END;

EXPORT MSDLayout := RECORD
    UNSIGNED4 RecID;
    STRING18  song_id;		
    STRING    title;
    UNSIGNED4 year;
    REAL      song_hotness;
    STRING18  artist_id;
    STRING375 artist_name;
    REAL      artist_hotness;
    REAL      familiarity;
    INTEGER   release_id;
    STRING    release_name;
    REAL      latitude;
    REAL      longitude;
    STRING    location;
    REAL      key;
    REAL      key_conf;
    REAL      loudness;
    INTEGER   mode;
    REAL      mode_conf;
    REAL      duration;
    REAL      start_of_fade_out;
    REAL      end_of_fade_in;
    REAL      tempo;
    REAL      time_signature;
    REAL      time_signature_conf; 
    INTEGER   CntBars;      //Bars_Analysis
    REAL      AvgBarsConf;  //Bars_Analysis   
    REAL      BarsConfDev;  //Bars_Analysis
    REAL      AvgBarsStart; //Bars_Analysis   
    REAL      BarsStartDev; //Bars_Analysis
    INTEGER   CntBeats;     //Beats_Analysis
    REAL      AvgBeatsConf; //Beats_Analysis   
    REAL      BeatsConfDev; //Beats_Analysis
    REAL      AvgBeatsStart;//Beats_Analysis   
    REAL      BeatsStartDev;//Beats_Analysis		
END;

//https://www.kaggle.com/datasets/amitanshjoshi/spotify-1million-tracks
EXPORT SpotMillion := RECORD
    UNSIGNED4 recid;
    STRING122 artist_name;
    STRING517 track_name;
    STRING22  track_id;
    UNSIGNED2 popularity;       //0 to 100
    UNSIGNED2 year;             //2000 to 2023
    STRING17  genre;            
    REAL4     danceability;     //0.0 to 1.0
    STRING8   energy;           //the perpetual measure of intensity and activity (0.0 to 1.0)
    UNSIGNED1 key;              //the key the track is in (-1 to -11)
    REAL4     loudness;         //overall loudness of track in decibels (-60 to 0db) 
    UNSIGNED1 mode;             //modality of the track (Major = 1/Minor = 0)
    REAL4     speechiness;      //presence of spoken word in the track
    STRING8   acousticness;     //confidence measure on whether the track is acoustic (0 to 1)
    STRING8   instrumentalness; //whether tracks contain vocals (0 to 1)
    REAL4     liveness;         //presence of audience in the recording (0 to 1)
    STRING8   valence;          //musical positiveness (0 to 1)
    REAL4     tempo;            //tempo of track in beats per minute
    UNSIGNED4 duration_ms;      //duration of track in milliseconds
    UNSIGNED1 time_signature;   //estimated time signature (3 to 7)
END;
   
EXPORT MozDS  := DATASET('~MIL::IN::MozTracks',MozLayout,CSV(HEADING(1)));
EXPORT MSDDS  := DATASET('~MIL::IN::MillionSongs',MSDLayout,CSV(HEADING(1)));
EXPORT SpotDS := DATASET('~MIL::IN::SpotifyMillion',SpotMillion,CSV(HEADING(1)));
END;