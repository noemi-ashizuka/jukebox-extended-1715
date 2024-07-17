-- Livecode Queries

-- 1. List all customers (name + email), ordered alphabetically (no extra information) (Should yield 59 results)
-- SELECT first_name, last_name, email 
-- FROM customers 
-- ORDER BY first_name ASC; 

-- 2. Count the number of tracks that are shorter than 2 minutes (Should yield 93 results)
-- SELECT COUNT(*) FROM tracks WHERE milliseconds < 120000;

-- 3. List all 'Rock' tracks (only names) (Should yield 1297 results)
-- SELECT tracks.name FROM tracks JOIN genres ON tracks.genre_id = genres.id WHERE genres.name = "Rock";

-- 4. List tracks (Name + Composer) of the 'Classical' playlist (Should yield 75 results)

-- SELECT tracks.name, tracks.composer FROM tracks 
-- JOIN playlist_tracks ON tracks.id = playlist_tracks.track_id
-- JOIN playlists ON playlist_tracks.playlist_id = playlists.id
-- WHERE playlists.name = 'Classical';

-- 5. Which customers (first_name, last_name) has spent the most money and how much?
-- (Result -> Helena Holy with 49.62)
-- SELECT SUM(invoices.total) AS sum, customers.first_name, customers.last_name FROM customers
-- JOIN invoices ON customer_id = customers.id
-- GROUP BY customers.id
-- ORDER BY sum DESC;


-- 6. List the 10 artists most listed in all playlists
-- (First Result should be Iron Maiden with 516 occurences and the last should be Lenny Kravitz with 143 occurances)
-- SELECT artists.name, COUNT(*) AS c FROM artists 
-- JOIN albums ON artists.id = albums.artist_id
-- JOIN tracks ON albums.id = tracks.album_id
-- JOIN playlist_tracks ON playlist_tracks.track_id = tracks.id
-- GROUP BY artists.id
-- ORDER BY c DESC
-- LIMIT 10;


-- 7. List the tracks(composer + name) which have been purchased at least twice, ordered by number of purchases  (Should yield 265 results Steve Harris - The Trooper having 5 purchases)
SELECT tracks.composer, tracks.name, COUNT(*) as count
FROM tracks
JOIN invoice_lines ON tracks.id = invoice_lines.track_id
GROUP BY tracks.id
HAVING count >= 2
ORDER BY count DESC;
