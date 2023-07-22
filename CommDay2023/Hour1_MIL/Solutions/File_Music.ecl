EXPORT File_Music := MODULE
 EXPORT MozLayout := RECORD
  string45    name;
  string16    id;
  string11    rtype;
  string126   title;
  string131   genre;
  string28    releasedate;
  string2     disc;
  unsigned2   number;
  string657   tracktitle;
  string66    formats;
  string77    label;
  string107   catalognumber;
  string250   producers;
  string150   coversrc;
  string4981  guestmusicians;
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

EXPORT SpotLayout := RECORD
		INTEGER ID;
		STRING  Title;
		STRING  Artist;
		STRING  TopGenre;
		INTEGER Year;
		INTEGER BeatsPerMinute;
		DECIMAL Energy;
		DECIMAL Danceability;
		DECIMAL Loudness;
		DECIMAL Liveness;
		DECIMAL Valence;
		DECIMAL SongDuration;
		DECIMAL Acousticness;
		DECIMAL Speechiness;
		DECIMAL Popularity;    
END;
   
EXPORT MozDS  := DATASET('~MIL::IN::MozTracks',MozLayout,CSV(HEADING(1)));
EXPORT MSDDS  := DATASET('~MIL::IN::MillionSongs',MSDLayout,CSV(HEADING(1)));
EXPORT SpotDS := DATASET('~MIL::IN::Spotify2000',SpotLayout,CSV(HEADING(1)));
END;