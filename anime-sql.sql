
DROP DATABASE IF EXISTS AnimeAnalytics;
CREATE DATABASE AnimeAnalytics;
USE AnimeAnalytics;


CREATE TABLE genre (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL
);

INSERT INTO genre VALUES
(1,'Action'),
(2,'Adventure'),
(3,'Comedy'),
(4,'Drama'),
(5,'Fantasy'),
(6,'Romance'),
(7,'Sports'),
(8,'Mystery'),
(9,'Sci-Fi'),
(10,'Supernatural');


CREATE TABLE studio (
    studio_id INT PRIMARY KEY,
    studio_name VARCHAR(100) NOT NULL
);

INSERT INTO studio VALUES
(1,'Studio Pierrot'),
(2,'Toei Animation'),
(3,'MAPPA'),
(4,'Madhouse'),
(5,'Ufotable'),
(6,'Bones'),
(7,'A-1 Pictures'),
(8,'Wit Studio'),
(9,'Kyoto Animation'),
(10,'CloverWorks');



CREATE TABLE anime (
    anime_id INT PRIMARY KEY,
    anime_name VARCHAR(150) NOT NULL,
    genre_id INT,
    studio_id INT,
    episodes INT,
    rating DECIMAL(3,1),
    release_year INT,
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id),
    FOREIGN KEY (studio_id) REFERENCES studio(studio_id)
);

INSERT INTO anime VALUES
(1,'Naruto',1,1,220,8.3,2002),
(2,'One Piece',2,2,1100,8.9,1999),
(3,'Dragon Ball Z',1,2,291,8.8,1989),
(4,'Bleach',1,1,366,8.2,2004),
(5,'Demon Slayer',1,5,63,8.6,2019),
(6,'Jujutsu Kaisen',1,3,47,8.7,2020),
(7,'Attack on Titan',4,8,89,9.0,2013),
(8,'My Hero Academia',1,6,159,8.0,2016),
(9,'Death Note',8,4,37,8.6,2006),
(10,'Hunter x Hunter',2,4,148,9.0,2011),
(11,'Fullmetal Alchemist Brotherhood',4,6,64,9.1,2009),
(12,'Haikyuu',7,10,85,8.7,2014),
(13,'Spy x Family',3,10,37,8.5,2022),
(14,'Tokyo Revengers',4,3,50,7.8,2021),
(15,'One Punch Man',3,6,24,8.5,2015),
(16,'Sword Art Online',5,7,96,7.5,2012),
(17,'Black Clover',1,1,170,8.2,2017),
(18,'Chainsaw Man',1,3,12,8.5,2022),
(19,'Blue Lock',7,8,24,8.3,2022),
(20,'Your Name',6,9,1,8.8,2016);


CREATE TABLE characters (
    character_id INT PRIMARY KEY,
    character_name VARCHAR(100) NOT NULL,
    anime_id INT,
    role_type VARCHAR(30),
    power_level INT,
    popularity INT,
    FOREIGN KEY (anime_id) REFERENCES anime(anime_id)
);

-- Multiple characters from different anime
INSERT INTO characters VALUES
(1,'Naruto Uzumaki',1,'Main',95,98),
(2,'Sasuke Uchiha',1,'Main',94,96),
(3,'Sakura Haruno',1,'Main',75,85),
(4,'Kakashi Hatake',1,'Supporting',90,94),
(5,'Monkey D. Luffy',2,'Main',98,99),
(6,'Roronoa Zoro',2,'Main',96,97),
(7,'Nami',2,'Supporting',70,91),
(8,'Sanji',2,'Main',92,95),
(9,'Goku',3,'Main',100,100),
(10,'Vegeta',3,'Main',98,98),
(11,'Gohan',3,'Main',94,93),
(12,'Ichigo Kurosaki',4,'Main',96,96),
(13,'Rukia Kuchiki',4,'Main',88,91),
(14,'Orihime Inoue',4,'Supporting',75,88),
(15,'Tanjiro Kamado',5,'Main',91,97),
(16,'Nezuko Kamado',5,'Main',88,98),
(17,'Zenitsu Agatsuma',5,'Supporting',82,94),
(18,'Inosuke Hashibira',5,'Supporting',86,91),
(19,'Yuji Itadori',6,'Main',89,95),
(20,'Megumi Fushiguro',6,'Main',91,94),
(21,'Satoru Gojo',6,'Main',100,100),
(22,'Mikasa Ackerman',7,'Main',97,99),
(23,'Eren Yeager',7,'Main',98,99),
(24,'Levi Ackerman',7,'Main',100,100),
(25,'Armin Arlert',7,'Supporting',80,92),
(26,'Izuku Midoriya',8,'Main',92,96),
(27,'Katsuki Bakugo',8,'Main',94,95),
(28,'Shoto Todoroki',8,'Main',93,96),
(29,'Light Yagami',9,'Main',90,98),
(30,'L',9,'Main',95,99),
(31,'Gon Freecss',10,'Main',91,95),
(32,'Killua Zoldyck',10,'Main',94,99),
(33,'Kurapika',10,'Main',88,93),
(34,'Edward Elric',11,'Main',90,97),
(35,'Alphonse Elric',11,'Main',86,92),
(36,'Roy Mustang',11,'Supporting',91,94),
(37,'Hinata Shoyo',12,'Main',85,97),
(38,'Kageyama Tobio',12,'Main',88,96),
(39,'Loid Forger',13,'Main',90,95),
(40,'Anya Forger',13,'Main',70,99),
(41,'Mikey',14,'Main',93,94),
(42,'Takemichi Hanagaki',14,'Main',65,88),
(43,'Saitama',15,'Main',100,99),
(44,'Genos',15,'Supporting',90,91),
(45,'Kirito',16,'Main',94,95),
(46,'Asta',17,'Main',93,94),
(47,'Denji',18,'Main',92,97),
(48,'Isagi Yoichi',19,'Main',87,94),
(49,'Mitsuha Miyamizu',20,'Main',75,96),
(50,'Taki Tachibana',20,'Main',76,95);


CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100),
    country VARCHAR(50)
);

INSERT INTO users VALUES
(1,'Om','India'),
(2,'Rahul','India'),
(3,'Aman','India'),
(4,'John','USA'),
(5,'Yuki','Japan'),
(6,'David','UK'),
(7,'Alex','Canada'),
(8,'Rohan','India');

CREATE TABLE reviews (
    review_id INT PRIMARY KEY,
    user_id INT,
    anime_id INT,
    score INT,
    review_text VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (anime_id) REFERENCES anime(anime_id)
);

INSERT INTO reviews VALUES
(1,1,1,9,'Great story'),
(2,2,2,10,'Amazing adventure'),
(3,3,5,9,'Excellent animation'),
(4,4,7,10,'Amazing story'),
(5,5,6,9,'Great characters'),
(6,6,9,10,'Excellent anime'),
(7,7,11,10,'Masterpiece'),
(8,8,12,9,'Very inspiring'),
(9,1,15,8,'Very funny'),
(10,2,18,9,'Great action');


SELECT * FROM anime;

SELECT * FROM characters;

SELECT anime_name, rating
FROM anime;

SELECT anime_name, episodes
FROM anime
ORDER BY episodes DESC;

SELECT anime_name, rating
FROM anime
WHERE rating >= 8.5;

SELECT anime_name, release_year
FROM anime
WHERE release_year >= 2020;


SELECT COUNT(*) AS total_anime
FROM anime;

SELECT AVG(rating) AS average_rating
FROM anime;

SELECT MAX(rating) AS highest_rating
FROM anime;

SELECT MIN(rating) AS lowest_rating
FROM anime;

SELECT SUM(episodes) AS total_episodes
FROM anime;


SELECT
    g.genre_name,
    COUNT(a.anime_id) AS total_anime,
    AVG(a.rating) AS average_rating
FROM genre g
LEFT JOIN anime a
ON g.genre_id = a.genre_id
GROUP BY g.genre_name
ORDER BY total_anime DESC;

SELECT
    s.studio_name,
    COUNT(a.anime_id) AS total_anime,
    AVG(a.rating) AS average_rating
FROM studio s
LEFT JOIN anime a
ON s.studio_id = a.studio_id
GROUP BY s.studio_name
ORDER BY average_rating DESC;


SELECT
    a.anime_name,
    g.genre_name,
    s.studio_name,
    a.episodes,
    a.rating,
    a.release_year
FROM anime a
JOIN genre g
ON a.genre_id = g.genre_id
JOIN studio s
ON a.studio_id = s.studio_id
ORDER BY a.rating DESC;


SELECT
    character_name,
    popularity
FROM characters
ORDER BY popularity DESC;

SELECT
    character_name,
    power_level
FROM characters
WHERE power_level >= 95
ORDER BY power_level DESC;

SELECT
    role_type,
    COUNT(*) AS total_characters,
    AVG(popularity) AS average_popularity
FROM characters
GROUP BY role_type;


SELECT
    a.anime_name,
    c.character_name,
    c.role_type,
    c.power_level,
    c.popularity
FROM anime a
JOIN characters c
ON a.anime_id = c.anime_id
ORDER BY a.anime_name, c.popularity DESC;


SELECT
    a.anime_name,
    c.character_name,
    c.popularity
FROM anime a
JOIN characters c
ON a.anime_id = c.anime_id
WHERE c.popularity >= 95
ORDER BY c.popularity DESC;


SELECT
    a.anime_name,
    COUNT(c.character_id) AS character_count
FROM anime a
LEFT JOIN characters c
ON a.anime_id = c.anime_id
GROUP BY a.anime_name
ORDER BY character_count DESC;


SELECT
    anime_name,
    rating,
    CASE
        WHEN rating >= 9 THEN 'Excellent'
        WHEN rating >= 8 THEN 'Very Good'
        WHEN rating >= 7 THEN 'Good'
        ELSE 'Average'
    END AS rating_category
FROM anime;


SELECT
    anime_name,
    rating
FROM anime
WHERE rating > (
    SELECT AVG(rating)
    FROM anime
)
ORDER BY rating DESC;


SELECT
    character_name,
    power_level,
    popularity
FROM characters
ORDER BY popularity DESC
LIMIT 10;

SELECT
    a.anime_name,
    COUNT(r.review_id) AS total_reviews,
    AVG(r.score) AS average_score
FROM anime a
LEFT JOIN reviews r
ON a.anime_id = r.anime_id
GROUP BY a.anime_name
ORDER BY average_score DESC;

SELECT
    u.user_name,
    COUNT(r.review_id) AS reviews_given,
    AVG(r.score) AS average_score
FROM users u
LEFT JOIN reviews r
ON u.user_id = r.user_id
GROUP BY u.user_name
ORDER BY reviews_given DESC;

WITH AnimeStats AS (
    SELECT
        genre_id,
        COUNT(*) AS total_anime,
        AVG(rating) AS avg_rating
    FROM anime
    GROUP BY genre_id
)
SELECT
    g.genre_name,
    AnimeStats.total_anime,
    AnimeStats.avg_rating
FROM AnimeStats
JOIN genre g
ON AnimeStats.genre_id = g.genre_id
ORDER BY AnimeStats.avg_rating DESC;

SELECT
    anime_name,
    rating,
    RANK() OVER (ORDER BY rating DESC) AS rating_rank
FROM anime;

SELECT
    character_name,
    power_level,
    RANK() OVER (ORDER BY power_level DESC) AS power_rank
FROM characters;

SELECT
    a.anime_id,
    a.anime_name,
    g.genre_name,
    s.studio_name,
    a.episodes,
    a.rating,
    a.release_year,
    COUNT(c.character_id) AS total_characters,
    AVG(c.popularity) AS avg_character_popularity
FROM anime a
JOIN genre g
ON a.genre_id = g.genre_id
JOIN studio s
ON a.studio_id = s.studio_id
LEFT JOIN characters c
ON a.anime_id = c.anime_id
GROUP BY
    a.anime_id,
    a.anime_name,
    g.genre_name,
    s.studio_name,
    a.episodes,
    a.rating,
    a.release_year;

SELECT
    COUNT(DISTINCT a.anime_id) AS total_anime,
    COUNT(DISTINCT c.character_id) AS total_characters,
    ROUND(AVG(a.rating),2) AS average_anime_rating,
    MAX(a.rating) AS highest_rating,
    SUM(a.episodes) AS total_episodes,
    ROUND(AVG(c.popularity),2) AS average_character_popularity
FROM anime a
LEFT JOIN characters c
ON a.anime_id = c.anime_id;