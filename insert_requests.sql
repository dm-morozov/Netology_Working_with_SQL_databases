-- Задание 1

-- Продолжаем работать со своей базой данных. 
-- В этом задании заполните базу данных из домашнего задания к занятию "Работа с SQL. 
-- Создание БД". В ней должно быть:

-- не менее 3 жанров
INSERT INTO genre(name)
VALUES ('Pop'), ('Rock'), ('Hip-Hop');
INSERT INTO genre(name)
VALUES ('Rap');
SELECT *
FROM genre;

-- не менее 4 исполнителей
INSERT INTO artist(name)
VALUES ('Егор Крид'), ('Валя Карнавал'), ('Коля Басков'), ('Моргенштерн');
SELECT *
FROM artist;

-- не менее 3 альбомов
INSERT INTO album(name, year)
VALUES ('PUSSY BOY', 2023), ('Маме верь', 2021), ('Обниму тебя', 2020), ('Лез Гризи', 2022);
SELECT *
FROM album;

-- не менее 6 треков
INSERT INTO track (name, duration, album_id)
VALUES ('Pussy Boy', 180, 1),
       ('Потрачу', 195, 1),
       ('Ты меня не была', 210, 2),
       ('Жути', 165, 2),
       ('Обниму тебя', 220, 3),
       ('Любовью за периметром', 240, 3),
       ('Я ж гризи', 140, 4),
       ('Оксимирон убил Мирона', 170, 4);
SELECT *
FROM track;

-- не менее 4 сборников
SELECT *
FROM collection;
INSERT INTO collection (name, year)
VALUES ('Бодрое утро', 2023),
       ('Поп-новинки', 2023),
       ('Женский вокал', 2021),
       ('Популярная эстрада', 2023),
       ('Новая школа рэпа', 2023);

-- Должны быть заполнены все поля каждой таблицы, 
-- в том числе таблицы связей исполнителей с жанрами, 
-- исполнителей с альбомами, сборников с треками

SELECT *
FROM genres_artists;
INSERT INTO genres_artists (gender_id, artists_id)
VALUES (1, 1),
       (2, 4),
       (3, 1),
       (1, 4),
       (4, 1),
       (4, 4);

SELECT *
FROM artist_album;
INSERT INTO artist_album(artist_id, album_id)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4);

SELECT *
FROM collection_track;
-- Удалили третий трек из коллеции, чтобы в четвертом задании значения были не пустые
-- delete from collection_track 
-- where id = 9;
INSERT INTO collection_track(collection_id, track_id)
VALUES (1, 1),
       (1, 2),
       (1, 4),
       (1, 7),
       (1, 8),
       (2, 1),
       (3, 4),
       (4, 5),
       (4, 6),
       (5, 1),
       (5, 2),
       (5, 7),
       (5, 8);