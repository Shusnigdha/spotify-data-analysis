CREATE TABLE spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    album VARCHAR(255),
    album_type VARCHAR(50),
    danceability FLOAT,
    energy FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_min FLOAT,
    title VARCHAR(255),
    channel VARCHAR(255),
    views FLOAT,
    likes BIGINT,
    comments BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);

SELECT * FROM spotify LIMIT 100;

-- EDA

SELECT COUNT(*) FROM spotify;

SELECT COUNT(DISTINCT artist) FROM spotify;

SELECT COUNT(DISTINCT album) FROM spotify;

SELECT DISTINCT  album_type FROM spotify;

SELECT MIN(duration_min) FROM spotify;

-- removing rows where duration_min is 0 - incosistent data
SELECT * FROM spotify
WHERE duration_min = 0;

DELETE FROM spotify
WHERE duration_min = 0;


SELECT DISTINCT channel FROM spotify;

-- Data Analysis - easy / medium level

-- tracks having more than 1B streams
SELECT * FROM spotify
WHERE stream > 1000000000;

-- all albums along with their respective artists
SELECT DISTINCT album, artist FROM spotify

-- distribution of album types
SELECT album_type, COUNT(*) AS total_tracks, COUNT(DISTINCT artist) AS unique_artists
FROM spotify
GROUP BY album_type;

-- tracks by platform
SELECT most_played_on, COUNT(*) AS track_count
FROM spotify
GROUP BY most_played_on;
GROUP BY album_type;

-- Perfromance & Engagement -

-- top 10 performing tracks 
SELECT track, views, likes, comments
FROM spotify
ORDER BY views DESC
LIMIT 10;

-- top 10 performing artists
SELECT artist, SUM(stream) AS total_streams
FROM spotify
GROUP BY artist
ORDER BY total_streams DESC
LIMIT 10;

-- engagement analysis
SELECT track, views, likes, comments
FROM spotify
ORDER BY views DESC;

-- avg engagement per artist
SELECT 
artist,
AVG(views) AS avg_views,
AVG(likes) AS avg_likes,
AVG(comments) AS avg_comments
FROM spotify
GROUP BY artist;

-- Licensed vs Unlicensed tracks performance
SELECT 
    licensed,
    SUM(views) AS total_views,
    SUM(likes) AS total_likes,
    SUM(comments) AS total_comments
FROM spotify
GROUP BY licensed;

-- Audio feature analysis -

-- avg audio feature scores of tracks
SELECT track,
AVG(danceability) AS avg_danceability,
AVG(energy) AS avg_energy,
AVG(valence) AS avg_valence,
AVG(acousticness) AS avg_acousticness
FROM spotify
GROUP BY track;

-- most energetic tracks
SELECT track, artist, energy
FROM spotify
ORDER BY energy DESC
LIMIT 10;

-- avg audio features by album type
SELECT 
album_type,
AVG(danceability) AS avg_danceability,
AVG(energy) AS avg_energy
FROM spotify
GROUP BY album_type;

-- Advanced Level Queries -

-- top 3 most viewed tracks for each artist using window function
WITH ranking_artist AS
(SELECT artist, track, SUM(views) AS total_views,
DENSE_RANK() OVER (PARTITION BY artist ORDER BY SUM (views) DESC) as rank
FROM spotify
GROUP BY artist, track
ORDER BY artist, SUM(views) DESC)
SELECT * FROM ranking_artist WHERE rank <= 3;

-- tracks that have been streamed on Spotify more than YouTube using subquery
SELECT * FROM
(SELECT track,
COALESCE(SUM(CASE WHEN most_played_on = 'Youtube' THEN stream END), 0) as streamed_on_youtube,
COALESCE(SUM(CASE WHEN most_played_on = 'Spotify' THEN stream END), 0) as streamed_on_spotify
FROM spotify
GROUP BY track) as t1
WHERE streamed_on_spotify > streamed_on_youtube
AND streamed_on_youtube <> 0

-- tracks where the liveness score is above the average using subquery
SELECT track, liveness from spotify 
WHERE liveness > (SELECT avg(liveness) FROM spotify);

-- using WITH clause to calculate the difference between the hughest and lowest energy values for tracks in each album
WITH album_energy AS
(SELECT album, MAX(energy) as highest_energy, MIN(energy) as lowest_energy
FROM spotify 
GROUP BY album)
SELECT album,
highest_energy - lowest_energy AS enegy_difference
FROM album_energy
ORDER BY 2 DESC;