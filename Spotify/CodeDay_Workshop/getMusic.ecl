/*
MODULES are NOT runnable/executable.
Please don't run this code.

In this code, record layout for Spotify dataset is created, then dataset is build.
*/

EXPORT getMusic := MODULE

// Define music layout/record definition
	EXPORT Spotify_Layout := RECORD
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
	
	//Create dataset
	EXPORT SpotifyDS := DATASET(
									'~spotify::music::data::top::2000::csv', //File name
                                    Spotify_Layout, //Dataset record definition
                                    CSV(HEADING(1)) //File formart. In this case row #1 of file is the file header
									);

END;