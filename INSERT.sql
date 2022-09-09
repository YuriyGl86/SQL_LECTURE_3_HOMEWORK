INSERT INTO genre (genre_name)
VALUES
	('rock'),
	('blues'),
	('jazz'),
	('pop'),
	('rap');
	
INSERT INTO performer(performer_name)
VALUES
	('Nirvana'),
	('Metallica'),
	('Eric Clapton'),
	('Gary Moore'),
	('Michael Jackson'),
	('Frank Sinatra'),
	('Eminem'),
	('Ария');

INSERT INTO albums(album_title, year_release)
VALUES
	('Kamikaze', 2018),
	('The Eminem SHOW', 2002),
	('Герой асфальта', 1988),
	('Master of Puppets', 1986),
	('Black Album', 1991),
	('Nevermind', 1991),
	('Bad', 1987),
	('In the Wee Small Hours', 1955),
	('After Hours', 1992),
	('S&M2', 2019),
	('SuperAlbum2020', 2020);

INSERT INTO tracks(track_title, album_id, duretion)
VALUES	
	('My Friend of Misery', 4, '00:06:48'),
	('Without Me', 1, '00:04:23'),
	('Sing for the Moment', 1, '00:05:39'),
	('Улица роз', 2, '00:05:56'),
	('Герой асфальта', 2, '00:05:11'),
	('Master of Puppets', 3, '00:08:36'),
	('The Thing That Should Not Be', 3, '00:06:37'),
	('Nothing else metters', 4, '00:06:27'),
	('Unforgiven', 4, '00:06:26'),
	('Smells Like Teen Spirit', 5 , '00:05:01'),
	('Come as You Are', 5 , '00:03:38'),
	('Smooth Criminal', 6, '00:04:19'),
	('Bad', 6, '00:04:07'),
	('In the Wee Small Hours of the Morning', 7, '00:03:00'),
	('Glad to Be Unhappy ', 7, '00:02:35'),
	('Cold Day in Hell', 8, '00:04:27'),
	('Story of the Blues', 8, '00:06:41'),
	('The Ecstasy of Gold', 10, '00:02:41'),
	('For Whom the Bell Tolls', 10, '00:04:37')

INSERT INTO genreperformer
VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(2, 3),
	(1, 4),
	(2, 4),
	(3, 4),
	(1, 5),
	(4, 5),
	(3, 6),
	(4, 6),
	(5, 7),
	(1, 8);

INSERT INTO performeralbum 
VALUES
	(7, 9),
	(1, 5),
	(8, 2),
	(4, 8),
	(5, 6),
	(6, 7),
	(7, 1),
	(2, 3),
	(2, 4),
	(2, 10),
	(3, 11);
	
INSERT INTO collection(collection_title, year_release)
VALUES
	('Best Ballads', 2018),
	('8 Mile: Music from and Inspired by the Motion Picture', 2002),
	('Curtain Call: The Hits', 2005),
	('Eminem Presents: The Re-Up', 2006),
	('Shady XV', 2014),
	('Southpaw: Music from and Inspired by the Motion Picture', 2015),
	('Best of rock', 2019),
	('Best of blues', 2020);
	

INSERT INTO collectiontrack
VALUES
	(1, 6),
	(1, 7),
	(1, 8),
	(2, 1),
	(2, 2),
	(7, 3),
	(7, 4),
	(7, 5),
	(7, 9),
	(7, 10);
	
	
	

