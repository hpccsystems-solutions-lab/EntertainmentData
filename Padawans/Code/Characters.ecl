// Data source and license info: https://www.kaggle.com/datasets/ulrikthygepedersen/star-wars-characters

IMPORT $;
EXPORT Characters := DATASET('~padawans::star_wars_characters',$.Layout_Characters,CSV(HEADING(1)));