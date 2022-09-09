--1 количество исполнителей в каждом жанре
SELECT genre_name, COUNT(performer_name) AS number_of_performers
FROM genreperformer
JOIN genre USING (genre_id)
JOIN performer USING (performer_id)
GROUP BY genre_name
ORDER BY number_of_performers DESC ;


--2 количество треков, вошедших в альбомы 2019-2020 годов
SELECT COUNT(track_id)
FROM tracks
JOIN albums USING (album_id)
WHERE year_release BETWEEN 2019 AND 2020;


--3 средняя продолжительность треков по каждому альбому
SELECT album_title , AVG(duretion) AS average_time
FROM tracks
JOIN albums USING (album_id)
GROUP BY album_title
ORDER BY average_time;


--4 все исполнители, которые не выпустили альбомы в 2020 году
SELECT performer_name
FROM performer
WHERE performer_id NOT IN (SELECT DISTINCT performer_id
							FROM performeralbum 
							JOIN albums USING(album_id)
							WHERE year_release = 2020);

--5 названия сборников, в которых присутствует конкретный исполнитель (выберите сами) == Eminem
SELECT DISTINCT collection_title
FROM collectiontrack c 
JOIN collection USING (collection_id)
JOIN tracks USING (track_id)
JOIN albums USING (album_id)
JOIN performeralbum USING (album_id)
JOIN performer USING (performer_id)
WHERE performer_name = 'Eminem';
			
			
--6 название альбомов, в которых присутствуют исполнители более 1 жанра
SELECT album_title, COUNT(genre_id) AS genre_count
FROM performeralbum
JOIN albums USING (album_id)
JOIN performer USING (performer_id)
JOIN genreperformer USING (performer_id)
GROUP BY album_title
HAVING COUNT(genre_id) > 1


--7 наименование треков, которые не входят в сборники
SELECT track_title 
FROM tracks
LEFT JOIN collectiontrack USING (track_id)
WHERE collection_id IS NULL;


--8 исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько)
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


--9 название альбомов, содержащих наименьшее количество треков.
SELECT album_title, COUNT(track_title)
FROM albums
JOIN tracks USING (album_id)
GROUP BY album_title 
HAVING count(track_title) = (
	SELECT COUNT(track_title)
	FROM albums
	JOIN tracks USING (album_id)
	GROUP BY album_title
	ORDER BY COUNT(track_title)
	LIMIT 1);







