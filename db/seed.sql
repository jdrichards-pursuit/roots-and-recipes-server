-- you do not need to seed users
-- you should run 'npm run db:init' to initialize the database
-- start your front and backends
-- instead now you should create users with firebase that will register also to your backend
-- when seeding other fields in other tables and you need the foreign key of user Id, retrieve the userIds from looking on postico or using psql
-- SELECT * from users 
-- manually place the id into your INSERT INTO values

\c rr_db

INSERT INTO families(
family_name, code 
) VALUES('defaultFamily', '000000');

INSERT INTO users(
     uid, email, username, first_name, last_name, password, photo, nickname, family_code, created_at, updated_at
)
VALUES(
     'xJgmWfoxKwcqP7h8WYLlfc6aguB2', 'bobBobby@gmail.com', 'bob_bobby', 'Bob', 'Bobby', 'bobbobby', NULL, 'bobby', '000000', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
);

INSERT INTO recipes(
    name, chef, family, user_id, photo, status, created_at
) VALUES 
    ('Spaghetti Bolognese', 'Uncle John', 'defaultFamily', 1, 'spaghetti.jpg', FALSE, CURRENT_TIMESTAMP),
    ('Chicken Curry', 'Auntie Jane', 'defaultFamily', 1, 'chicken_curry.jpg', TRUE, CURRENT_TIMESTAMP),
    ('Beef Stew', 'Grandpa', 'defaultFamily', 1, 'beef_stew.jpg', FALSE, CURRENT_TIMESTAMP),
    ('Grilled Salmon', 'Mom', 'defaultFamily', 1, 'grilled_salmon.jpg', TRUE, CURRENT_TIMESTAMP),
    ('Vegetable Stir Fry', 'Anna Banana', 'defaultFamily', 1, 'veg_stir_fry.jpg', FALSE, CURRENT_TIMESTAMP);