
TRUNCATE TABLE recipes RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO recipes (name, mins, stars) VALUES ('Pizza', '300','5');
INSERT INTO recipes (name, mins, stars) VALUES ('Gnocchi', '30','2');