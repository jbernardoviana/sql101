Run `sqlite3 chinook.sqlite`

Write the SQL queries to answer these questions:
1. List all customers (name + email), ordered alphabetically (no extra information)
SELECT first_name, last_name, email
FROM customers
ORDER BY last_name

2. List tracks (Name + Composer) of the Classical playlist
SELECT tracks.name, tracks.composer FROM tracks
JOIN playlist_tracks ON playlist_tracks.track_id = tracks.id
JOIN playlists ON playlist_tracks.playlist_id = playlists.id
WHERE playlists.name = "Classical"

3. List the 10 artists mostly listed in all playlists
SELECT artists.name, COUNT(*) AS c
FROM artists
JOIN albums ON artists.id = albums.artist_id
JOIN tracks ON albums.id = tracks.album_id
JOIN playlist_tracks ON tracks.id = playlist_tracks.track_id
GROUP BY artists.name
ORDER BY c DESC
LIMIT 10

4. List the tracks which have been purchased at least twice,
  ordered by number of purchases

SELECT tracks.composer, tracks.name, COUNT(*) AS c FROM tracks
JOIN invoice_lines ON tracks.id = invoice_lines.track_id
GROUP BY tracks.id
HAVING c >= 2
ORDER BY c DESC

SELECT tracks.composer, tracks.name, COUNT(*) AS c FROM tracks
JOIN invoice_lines ON tracks.id = invoice_lines.track_id
GROUP BY tracks.id
WHERE c >= 2
ORDER BY c DESC







