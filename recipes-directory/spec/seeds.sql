-- EXAMPLE
-- (file: spec/seeds.sql)

-- Write your SQL seed here. 

CREATE TABLE recipes (
  id SERIAL PRIMARY KEY,
  name text,
  mins int,
  stars int
);

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE recipes RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO recipes (name, mins, stars) VALUES ('Pizza', '300','5');
INSERT INTO recipes (name, mins, stars) VALUES ('Gnocchi', '30','2');