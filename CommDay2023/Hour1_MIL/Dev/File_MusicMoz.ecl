IMPORT STD;
//Downloads at https://musicmoz.org/xml/
EXPORT File_MusicMoz := MODULE
/* <musicmoz>
   <category name="Bands_and_Artists/0/003/Discography/Chasing_The_Sun" canapply="1" cansubmit="1">
      <item id="12570-1003152687" type="release">
         <title>Chasing The Sun</title>
         <genre>Pop</genre>
         <releasedate>2001</releasedate>
         <formats>CD, netCD</formats>
         <label>MP3.com</label>
         <tracklisting>   <track number="1" title="Afternoon" />
            <track number="2" title="Tadaima" />
            <track number="3" title="Ashita no Hako" />
            <track number="4" title="Chasing The Sun" />
            <track number="5" title="Mitsukenikui Sagashimono" />
            <track number="6" title="Sorahe" />
            <track number="7" title="Yamato Daikon" />
         </tracklisting>
      </item>
   </category>
   </musicmoz>
*/

EXPORT TrackRecord := RECORD
  STRING disc{xpath('disc/@number')};
  STRING number{xpath('@number')};
  STRING tracktitle{xpath('@title')};
END;

EXPORT ItemRecord := RECORD
  STRING id{xpath('@id')};
  STRING rtype{xpath('@type')};
  STRING title{xpath('title')};
  STRING genre{xpath('genre')};
  STRING releaseDate{xpath('releasedate')};
  STRING formats{xpath('formats')};
  STRING label{xpath('label')};
  STRING CatalogNumber{xpath('cataloguenumber')};
  STRING producers{xpath('producers')};
  STRING guestmusicians{xpath('guestmusicians')};
  STRING description{xpath('description')};
  // STRING disc{xpath('tracklisting/@number')};
  DATASET(TrackRecord) Tracks{XPATH('tracklisting/track'),MAXCOUNT(653)};
	  //There is an Elvis Box Set with 30 discs and 653 tracks!
	STRING coversrc{xpath('cover/@src')};
END;

EXPORT ArtistRecord := RECORD
  STRING name{xpath('@name')};
  DATASET(ItemRecord) Items{XPATH('item'),MAXCOUNT(50)}; 
END;

// EXPORT File := DATASET('~mil::in::musicmoz_bandsandartists', ArtistRecord,XML('musicmoz/category'));
// EXPORT File := DATASET('~mil::in::musicmoz.complete', ArtistRecord,XML('musicmoz/category'));
EXPORT File := DATASET('~mil::in::musicmoz_completerev', ArtistRecord,XML('musicmoz/category'));
// EXPORT File := DATASET('~mil::in::musicmoz_releases', ArtistRecord,XML('musicmoz/category'));

SHARED trackrecordnew := RECORD
   string disc;
   string number;
   string tracktitle;
  END;

SHARED itemrecordnew := RECORD
  string id;
  string rtype;
  string title;
  string genre;
  string releasedate;
  string formats;
  string label;
  string catalognumber;
  string producers;
  string guestmusicians;
  string description;
  // string disc;
  DATASET(trackrecordnew) tracks{maxcount(653)};
  string coversrc;
 END;

EXPORT Layout2 := RECORD
 STRING name;
 DATASET(itemrecordnew) items{maxcount(50)}
END;

// { string name, DATASET(itemrecordnew) items{maxcount(50)} };

EXPORT File2  := DATASET('~MIL::NewBands_Artists',Layout2,THOR);
EXPORT RItems := File2.Items;

File2 ParseArtists(File2 Le) := TRANSFORM
FirstSlash  := STD.STR.Find(Le.Name,'/',2);
SecondSlash := STD.STR.Find(Le.Name,'/',3);
SELF.Name   := Le.Name[FirstSlash+1..SecondSlash-1];
// SELF.Name := Le.Name[21..40];
// SELF.Name    := (STRING)FirstSlash + (STRING)SecondSlash;
SELF        := Le; 
END;

EXPORT CleanBands_Artists := PROJECT(File2,ParseArtists(LEFT));

EXPORT ArtistReleaseDS := DATASET('~MIL::CleanedReleases',layout2,THOR);

						
END;