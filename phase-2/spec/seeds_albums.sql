-- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE artists RESTART IDENTITY;
TRUNCATE TABLE albums RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO artists (name, genre) VALUES ('Death Grips', 'Alt Rap');

INSERT INTO albums (title, release_year, artist_id) VALUES ('The Money Store', '2012', '1');
INSERT INTO albums (title, release_year, artist_id) VALUES ('Bottomless Pit', '2016', '1');