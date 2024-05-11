-- Задание 2

-- 1. Название и продолжительность самого длительного трека.
SELECT name, duration
FROM track
WHERE duration = (SELECT MAX(duration) FROM track);

-- 2. Название треков, продолжительность которых не менее 3,5 минут.
SELECT name, duration
FROM track
WHERE duration >= 210;

-- 3. Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT name, year
FROM collection
WHERE year BETWEEN 2018 AND 2020;

-- 4. Исполнители, чьё имя состоит из одного слова.
SELECT name
FROM artist
WHERE LENGTH(name) - LENGTH(REPLACE(name, ' ', '')) = 0;

-- 5. Название треков, которые содержат слово «мой» или «my» 
-- (от себя добавил %за% для проверки работоспособности кода т.к. в данной выборке нет не одного трека).
SELECT name
FROM track
WHERE name LIKE '%мой%'
   OR name LIKE '%my%'
   OR name LIKE '%за%';

-- Задание 3

-- 1. Количество исполнителей в каждом жанре.
SELECT g.name AS genre_name, COUNT(DISTINCT ga.artists_id) AS artist_count
FROM genre g
         JOIN genres_artists ga ON g.id = ga.gender_id
GROUP BY g.name;

-- 2. Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(*) AS track_count
FROM track t
         JOIN album a ON t.album_id = a.id
WHERE a.year BETWEEN 2019 AND 2020;

-- Вошли два трека. Чтобы посмотреть какие треки использкем команду:
SELECT t.name AS track_count
FROM track t
         JOIN album a ON t.album_id = a.id
WHERE a.year BETWEEN 2019 AND 2020;
SELECT *
FROM album a;

-- 3. Средняя продолжительность треков по каждому альбому.
SELECT a.name AS album_name, AVG(t.duration) AS avarage_duration
FROM track t
         JOIN album a ON t.album_id = a.id
GROUP BY a.name
ORDER BY avarage_duration DESC;

-- 4. Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT ar.name
FROM artist ar
         JOIN artist_album aa ON ar.id = aa.artist_id
         JOIN album al ON aa.album_id = al.id
WHERE NOT al.year = 2020;

-- 5. Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT DISTINCT col.name AS collection_name
FROM collection col
         JOIN collection_track ct ON col.id = ct.collection_id
         JOIN track t ON ct.track_id = t.id
         JOIN album al ON t.album_id = al.id
         JOIN artist_album aa ON al.id = aa.album_id
         JOIN artist ar ON aa.artist_id = ar.id
WHERE ar.name = 'Моргенштерн';

-- Задание 4(необязательное)

-- 1. Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT al.name AS album_name
FROM album al
         JOIN artist_album aa ON al.id = aa.album_id
         JOIN artist ar ON aa.artist_id = ar.id
         JOIN genres_artists ga ON ar.id = ga.artists_id
         JOIN genre g ON ga.gender_id = g.id
GROUP BY al.id
HAVING COUNT(DISTINCT g.id) > 1;

-- 2. Наименования треков, которые не входят в сборники.
SELECT tr.name name_track
FROM track tr
         LEFT JOIN collection_track ct ON tr.id = ct.track_id
WHERE ct.track_id IS NULL;

-- 3. Исполнитель или исполнители, написавшие самый короткий по продолжительности трек.
SELECT ar.name, tr.name, tr.duration
FROM artist ar
         JOIN artist_album aa ON ar.id = aa.artist_id
         JOIN album al ON aa.album_id = al.id
         JOIN track tr ON al.id = tr.album_id
WHERE tr.duration = (SELECT MIN(duration) FROM track);

-- 4. Названия альбомов, содержащих наименьшее количество треков.
-- До конца не доделал. Выводит только Название одного альбома.
-- И если альбомов много с одинаковым минимальным значением треков,
-- он выдаст только одно.
SELECT al.name AS album_name, COUNT(t.id) AS track_count
FROM album al
JOIN track t ON al.id = t.album_id
WHERE al.id = (
    SELECT tr.album_id
    FROM track tr
    GROUP BY tr.album_id
    ORDER BY COUNT(*) ASC
    LIMIT 1
)
GROUP BY album_name;

-- Доделал до конца.
SELECT al.name AS album_name, COUNT(t.id) AS track_count
FROM album al
LEFT JOIN track t ON al.id = t.album_id
GROUP BY al.name
HAVING COUNT(t.id) = (
    SELECT COUNT(id)
    FROM track
    GROUP BY album_id
    ORDER BY COUNT(id) ASC
    LIMIT 1
);