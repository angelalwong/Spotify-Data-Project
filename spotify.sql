/*
Top Hits Spotify from 2000-2019
data downloaded from https://www.kaggle.com/datasets/paradisejoy/top-hits-spotify-from-20002019

original csv file was converted to Western (ASCII) in CotEditor before import to MySQL
queries were ran in MySQL Workbench
*/

-- Select artists who have 2 or more songs in the Spotify Top Hits list (not one-hit wonder)
select *
from (
select artist, count(artist) as number_of_songs
from Spotify.songs_normalize
group by artist
order by number_of_songs DESC) N
where number_of_songs >1;

-- Select genres in order of most to least popular
select genre, count(genre)
from Spotify.songs_normalize
group by genre
order by count(genre) DESC;

-- Select the number of songs in the list: 2000
select count(song)
from Spotify.songs_normalize;

-- Select the number of distinct artists in the list: 835
select count(distinct artist)
from Spotify.songs_normalize;

-- Select the number of explicit songs: 551/2000
select count(explicit)
from Spotify.songs_normalize
where explicit = 'TRUE';

-- Select the number of non-explicit songs: 1449/2000
select count(explicit)
from Spotify.songs_normalize
where explicit = 'FALSE';

-- Select percentage of explicit songs: 27.55%
select count(explicit), count(explicit)*100/(select count(song) from Spotify.songs_normalize) as 'percentage of explicit songs'
from Spotify.songs_normalize
where explicit = 'TRUE';

-- Select percentage of non-explicit songs: 72.45%
select count(explicit), count(explicit)*100/(select count(song) from Spotify.songs_normalize) as 'percentage of explicit songs'
from Spotify.songs_normalize
where explicit = 'FALSE';

