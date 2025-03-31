--Represent the user
CREATE TABLE 'users' (
    'id' INTEGER,
    'nickname' TEXT NOT NULL,
    'first_name' TEXT NOT NULL,
    'last_name' TEXT NOT NULL,
    PRIMARY KEY ('id')
);

--Represent the band or artist how composed the album
CREATE TABLE 'artist' (
    'id' INTEGER,
    'name' TEXT NOT NULL,
    'genre' TEXT, --optional
    'country' TEXT, --optional
    'year' INTEGER, --optional
    PRIMARY KEY('id')
);

--Represent the album
CREATE TABLE 'album' (
    'id' INTEGER,
    'name' TEXT NOT NULL,
    'year' INTEGER NOT NULL,
    'artist_id' INTEGER NOT NULL,
    PRIMARY KEY('id'),
    FOREIGN KEY('artist_id') REFERENCES 'artist'('id') ON DELETE CASCADE
);

--Represents the albuns ratings
CREATE TABLE 'ratings' (
    'id' INTEGER,
    'album_id' INTEGER NOT NULL,
    'user_id' INTEGER NOT NULL,
    'rating' DECIMAL(2,1) NOT NULL,
    'coments' TEXT, --optional
    'date' CURRENT_DATE,
    FOREIGN KEY('album_id') REFERENCES 'album'('id') ON DELETE CASCADE,
    FOREIGN KEY('user_id') REFERENCES 'users'('id') ON DELETE CASCADE,
    PRIMARY KEY('id')
);

CREATE INDEX 'artist_name' ON 'artist'('name');
CREATE INDEX 'album_name' ON 'album'('name');
CREATE INDEX 'user_name' ON 'user'('name');
