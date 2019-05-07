-- DROP TABLE directors;
-- CREATE TABLE directors (
--   director_id SERIAL PRIMARY KEY,
--   name VARCHAR(250)
-- );

DROP TABLE films;
CREATE TABLE films (
  id SERIAL PRIMARY KEY,
  name VARCHAR(250),
  director_id INT references directors(director_id),
  logo VARCHAR(300)
);

INSERT INTO films(name, director_id, logo) VALUES ('Avengers: Endgame', 1, 'https://peopledotcom.files.wordpress.com/2019/03/avengers-endgame.jpg');
INSERT INTO films(name, director_id, logo) VALUES ('LOTR', 2, 'https://upload.wikimedia.org/wikipedia/en/9/9d/Lord_of_the_Rings_-_The_Return_of_the_King.jpg');
INSERT INTO films(name, director_id, logo) VALUES ('Star Wars', 3, 'https://m.media-amazon.com/images/M/MV5BNzVlY2MwMjktM2E4OS00Y2Y3LWE3ZjctYzhkZGM3YzA1ZWM2XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg');
