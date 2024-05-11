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
    id SERIAl PRIMARY KEY,
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

insert into genre(name) values 
('Pop'), 
('Rock'), 
('Hip-Hop');
insert into genre(name) values ('Rap');
select * from genre;

insert into artist(name) values 
('Егор Крид'), 
('Валя Карнавал'), 
('Коля Басков'), 
('Моргенштерн');
select * from artist;

insert into album(name, year) values 
('PUSSY BOY', 2023), 
('Маме верь', 2021), 
('Обниму тебя', 2020), 
('Лез Гризи', 2022);
select * from album;

insert into track (name, duration, album_id) values
('Pussy Boy', 180, 1),
('Потрачу', 195, 1),
('Ты меня не была', 210, 2),
('Жути', 165, 2),
('Обниму тебя', 220, 3),
('Любовью за периметром', 240, 3),
('Я ж гризи', 140, 4),
('Оксимирон убил Мирона', 170, 4);
select * from track;


select * from collection;
insert into collection (name, year) values 
('Бодрое утро', 2023),
('Поп-новинки', 2023),
('Женский вокал', 2021),
('Популярная эстрада', 2023),
('Новая школа рэпа', 2023);

select * from genres_artists;
insert into genres_artists (gender_id, artists_id) values
(1, 1),
(2, 4),
(3, 1),
(1, 4),
(4, 1),
(4, 4);

select * from artist_album;
insert into artist_album(artist_id, album_id) values
(1, 1),
(2, 2),
(3, 3),
(4, 4);

select * from collection_track;
insert into collection_track(collection_id, track_id) values
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 7),
(1, 8),
(2, 1),
(2, 2),
(3, 3),
(3, 4),
(4, 5),
(4, 6),
(5, 1),
(5, 2),
(5, 7),
(5, 8);