USE codeup_test_db;

SELECT 'All Albums' AS 'Info:';
SELECT * FROM albums;
SELECT 'All Albums released prior to 1980.' AS 'Info:';
SELECT * FROM albums WHERE release_date < 1980;
SELECT 'All Michael Jackson Albums' AS 'Info:';
SELECT name FROM albums WHERE artist = 'Michael Jackson';

SELECT 'All Albums = sales * 10' AS 'Info:';
UPDATE albums SET sales = sales * 10;
SELECT * FROM albums;

SELECT 'All Albums released prior to 1980 = -100' AS 'Info:';
UPDATE albums SET release_date = release_date - 100 WHERE release_date < 1980;
SELECT * FROM albums WHERE release_date < 1900;

SELECT 'Change artist name "Michael Jackson" to "Peter Jackson"' AS 'Info:';
UPDATE albums SET artist = 'Peter Jackson' WHERE artist = 'Michael Jackson';
SELECT name FROM albums WHERE artist = 'Peter Jackson';
