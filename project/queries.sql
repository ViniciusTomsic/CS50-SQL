-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database
-- An example of a query to select an artist from a specific country
SELECT 'name' FROM 'artist'
WHERE 'genre' = 'Rock' AND 'country' = 'Brasil';

-- A query to select top 10 country albuns
SELECT 'album'.'name', 'artist'.'name', AVG('ratings'.'rating') AS 'avg_rating' FROM 'album'
JOIN 'artist' ON 'album'.'artist_id' = 'artist'.'id'
JOIN 'ratings' ON 'album'.'id' = 'ratings'.'album_id'
WHERE 'artist'.'genre' = 'Country'
ORDER BY 'avg_rating' DESC
LIMIT 10

-- A view from best album despite the genre
CREATE VIEW 'best10' AS
SELECT 'album'.'name', AVG('ratings'.'rating') FROM 'album'
JOIN 'ratings' ON 'album'.'id' = 'ratings'.'album_id'
GROUP BY 'album'.'id'
LIMIT BY 10
