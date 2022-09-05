--количество исполнителей в каждом жанре
SELECT genre_name, COUNT(performer_name) AS number_of_performers
FROM genreperformer
JOIN genre USING (genre_id)
JOIN performer USING (performer_id)
GROUP BY genre_name
ORDER BY number_of_performers DESC ;


--количество треков, вошедших в альбомы 2019-2020 годов
SELECT COUNT(track_id)
FROM tracks
JOIN albums USING (album_id)
WHERE year_release BETWEEN 2019 AND 2020;


--средняя продолжительность треков по каждому альбому
SELECT album_title , AVG(duretion) AS average_time
FROM tracks
JOIN albums USING (album_id)
GROUP BY album_title
ORDER BY average_time;


--все исполнители, которые не выпустили альбомы в 2020 году
SELECT performer_name
FROM performer 
LEFT JOIN performeralbum USING (performer_id)
LEFT JOIN albums USING (album_id)
WHERE year_release <> 2020 OR year_release IS NULL
GROUP BY performer_name;


--названия сборников, в которых присутствует конкретный исполнитель (выберите сами) == Eminem
SELECT DISTINCT collection_title
FROM collectiontrack
JOIN collection USING (collection_id)
WHERE track_id IN 
	 			(SELECT track_id FROM tracks
	 			WHERE album_id IN (SELECT album_id
									FROM performeralbum
									JOIN performer USING (performer_id)
									WHERE performer_name = 'Eminem')
				);


--название альбомов, в которых присутствуют исполнители более 1 жанра
WITH multigenre_performers AS
(
	SELECT performer_id, COUNT(genre_id)
	FROM genreperformer
	GROUP BY performer_id 
	HAVING COUNT(genre_id) >= 2			
)
SELECT album_title
FROM performeralbum
JOIN albums USING (album_id)
WHERE performer_id IN (SELECT performer_id FROM multigenre_performers);


--наименование треков, которые не входят в сборники
SELECT track_title 
FROM tracks
LEFT JOIN collectiontrack USING (track_id)
WHERE collection_id IS NULL;


--исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько)
WITH short_track_album AS
(
SELECT album_id 
FROM tracks
WHERE duretion = (SELECT MIN(duretion)
				  FROM tracks)
)

SELECT performer_name
FROM performeralbum 
JOIN performer USING (performer_id)
WHERE album_id IN (SELECT album_id FROM short_track_album);


--название альбомов, содержащих наименьшее количество треков.
SELECT album_title
FROM tracks
JOIN albums USING (album_id)
GROUP BY album_title 
HAVING count(track_id) = (
							SELECT min(number_of_tracks) FROM 
							(SELECT album_id, count(track_id) AS number_of_tracks
							FROM tracks t 
							GROUP BY album_id) AS m
						  )






