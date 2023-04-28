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