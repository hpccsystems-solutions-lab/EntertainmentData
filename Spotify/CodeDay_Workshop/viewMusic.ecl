
IMPORT getMusic;

//Choose the first 200 rows
res := CHOOSEN(getMusic.SpotifyDS, 200);

//print result
OUTPUT(res, NAMED('Spotify_Top_Music'));
