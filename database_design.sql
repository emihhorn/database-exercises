CREATE DATABASE IF NOT EXISTS design_test_db;

USE design_test_db;

DROP TABLE IF EXISTS quote_topic;
DROP TABLE IF EXISTS quotes;
DROP TABLE IF EXISTS topics;
DROP TABLE IF EXISTS authors;

CREATE TABLE quotes (
                        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                        author_first_name VARCHAR(50) DEFAULT 'NONE',
                        author_last_name  VARCHAR(100) NOT NULL,
                        content TEXT NOT NULL,
                        PRIMARY KEY (id)
);


CREATE TABLE authors (
                         id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                         first_name VARCHAR(50),
                         last_name  VARCHAR(100) NOT NULL,
                         PRIMARY KEY (id)
);

ALTER TABLE quotes DROP COLUMN author_first_name;
ALTER TABLE quotes DROP COLUMN author_last_name;
ALTER TABLE quotes ADD COLUMN author_id INT UNSIGNED NOT NULL;
ALTER TABLE quotes ADD FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE NO ACTION ON UPDATE CASCADE;

SELECT * FROM quotes;

SELECT * FROM authors;



insert into authors(first_name, last_name) values
('Emily', 'Dickenson'),
('Douglas', 'Adams');



INSERT INTO quotes(author_id, content)
VALUES ((select id from authors where first_name = 'Emily' and last_name = 'Dickenson'),
        'It was not Death, for I stood up,
                And all the Dead, lie down–
                It was not Night, for all the Bells
                Put out their Tongues, for Noon.

                It was not Frost, for on my Flesh
                I felt Siroccos– crawl–
                Nor Fire– for just my Marble feet
                Could keep a Chancel, cool–

                And yet, it tasted, like them all,
                The Figures I have seen
                Set orderly, for Burial,
                Reminded me, of mine–

                As if my life were shaven,
                And fitted to a frame,
                And could not breathe without a key,
                And ''twas like Midnight, some–

                When everything that ticked– has stopped–
                And Space stares– all around–
                Or Grisly frosts– first Autumn morns,
                Repeal the Beating Ground–

                But, most, like Chaos– Stopless– cool–
                Without a Chance, or Spar–
                Or even a Report of Land–
                To justify– Despair.');

INSERT INTO quotes (author_id, content)
VALUES ((select id from authors where first_name = 'Douglas' and last_name = 'Adams'),
        'I love deadlines. I love the whooshing noise they make as they go by');


CREATE TABLE topics (
                        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                        name VARCHAR(255),
                        PRIMARY KEY (id)
);

INSERT INTO topics(name) VALUES
('Poetry'),
('Humor');


CREATE TABLE quote_topic (
                             quote_id INTEGER UNSIGNED NOT NULL,
                             topic_id INTEGER UNSIGNED NOT NULL,
                             FOREIGN KEY (quote_id) REFERENCES quotes(id),
                             FOREIGN KEY (topic_id) REFERENCES topics(id)
);


INSERT INTO quote_topic(quote_id, topic_id)
VALUES (1, 2);

