CREATE TABLE IF NOT EXISTS Genre
(
	genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(50)
);



CREATE TABLE IF NOT EXISTS Performer
(
	performer_id SERIAL PRIMARY KEY,
	performer_name VARCHAR(100)
);


CREATE TABLE IF NOT EXISTS GenrePerformer
(
	genre_id INT REFERENCES Genre(genre_id),
	performer_id INT REFERENCES Performer(performer_id),
	CONSTRAINT pk_GenrePerformer PRIMARY KEY (genre_id, performer_id)
);



CREATE TABLE IF NOT EXISTS Albums
(
	album_id SERIAL PRIMARY KEY,
	album_title varchar(100) NOT NULL,
	year_release int CHECK (year_release >= 1500 AND year_release <= 2100)
);


CREATE TABLE IF NOT EXISTS PerformerAlbum
(
	performer_id int REFERENCES Performer(performer_id),
	album_id int REFERENCES Albums(album_id),
	CONSTRAINT pk_PerformerAlbum PRIMARY KEY (performer_id, album_id)
);


CREATE TABLE IF NOT EXISTS Tracks
(
	track_id serial PRIMARY KEY,
	track_title varchar(100) NOT NULL,
	album_id int NOT NULL REFERENCES Albums(album_id),
	duretion time NOT NULL
);


CREATE TABLE IF NOT EXISTS Collection
(
	collection_id serial PRIMARY KEY,
	collection_title varchar(100) NOT NULL,
	year_release int CHECK (year_release >= 1500 AND year_release <= 2100) 
);


CREATE TABLE IF NOT EXISTS CollectionTrack
(
	collection_id int NOT NULL REFERENCES Collection(collection_id),
	track_id int NOT NULL REFERENCES Tracks(track_id),
	CONSTRAINT pk_CollectionTrack PRIMARY KEY (collection_id, track_id)
);