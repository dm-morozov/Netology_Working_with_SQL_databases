-- Работа с SQL. Создание БД. Музыкальный сервис

CREATE TABLE IF NOT EXISTS Genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Artist (
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Genres_Artists (
    id SERIAL PRIMARY KEY,
    gender_id INTEGER NOT NULL REFERENCES Genre(id),
    artists_id INTEGER NOT NULL REFERENCES Artist(id)
);

CREATE TABLE IF NOT EXISTS Album (
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) UNIQUE NOT NULL,
    year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Artist_Album (
    id SERIAL PRIMARY KEY,
    artist_id INTEGER NOT NULL REFERENCES Artist(id),
    album_id INTEGER NOT NULL REFERENCES Album(id)
);

CREATE TABLE IF NOT EXISTS Track (
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    duration INTEGER NOT NULL,
    album_id INTEGER NOT NULL REFERENCES Album(id)
);

CREATE TABLE IF NOT EXISTS Collection (
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) UNIQUE NOT NULL,
    year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Collection_Track (
    id SERIAL PRIMARY KEY,
    collection_id INTEGER NOT NULL REFERENCES Collection(id),
    track_id INTEGER NOT NULL REFERENCES Track(id)
);

-- alter table track rename if to id;