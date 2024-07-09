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
VALUES
     ('xJgmWfoxKwcqP7h8WYLlfc6aguB2', 'bobBobby@gmail.com', 'bob_bobby', 'Bob', 'Bobby', 'bobbobby', NULL, 'bobby', '000000', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
     ('XVeQN4ekEuZt8K5AGOezrlMJq5W2', 'gabby@gmail.com', 'the_gabby', 'Gabby', 'Peterson', 'thegabby', NULL, 'gabby', '000000', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
     ('dVPe9FZJc6X5IyUNyb9dLr4i51v1', 'mark@gmail.com', 'marker', 'Mark', 'Bell', 'markBell', NULL, 'marky', '000000', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
     ('aB7pQ3JHk2T8LxWNm5j2Er1o67v3', 'john.doe@example.com', 'johndoe123', 'John', 'Doe', 'johnDoe', NULL, 'johnny', '000000', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
     ('cH8rY5JLm4U9OxZNm6k3Gs2p78w4', 'jane.smith@example.com', 'janesmith456', 'Jane', 'Smith', 'janeSmith', NULL, 'janie', '000000', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


    INSERT INTO recipes(
    name, chef, family, user_id, photo, status, created_at
) VALUES 
    ('Spaghetti Bolognese', 'Uncle John', 'defaultFamily', 1, 'spaghetti.jpg', FALSE, CURRENT_TIMESTAMP),
    ('Chicken Curry', 'Auntie Jane', 'defaultFamily', 1, 'chicken_curry.jpg', TRUE, CURRENT_TIMESTAMP),
    ('Beef Stew', 'Grandpa', 'defaultFamily', 1, 'beef_stew.jpg', FALSE, CURRENT_TIMESTAMP),
    ('Grilled Salmon', 'Mom', 'defaultFamily', 1, 'grilled_salmon.jpg', TRUE, CURRENT_TIMESTAMP),
    ('Vegetable Stir Fry', 'Anna Banana', 'defaultFamily', 1, 'veg_stir_fry.jpg', FALSE, CURRENT_TIMESTAMP),
    ('Lasagna', 'Dad', 'defaultFamily', 2, 'lasagna.jpg', TRUE, CURRENT_TIMESTAMP),
    ('Pancakes', 'Grandma', 'defaultFamily', 2, 'pancakes.jpg', FALSE, CURRENT_TIMESTAMP),
    ('Tacos', 'Uncle Mike', 'defaultFamily', 2, 'tacos.jpg', TRUE, CURRENT_TIMESTAMP),
    ('Caesar Salad', 'Aunt Mary', 'defaultFamily', 2, 'caesar_salad.jpg', FALSE, CURRENT_TIMESTAMP),
    ('BBQ Ribs', 'Dad', 'defaultFamily', 3, 'bbq_ribs.jpg', TRUE, CURRENT_TIMESTAMP),
    ('Fish Tacos', 'Brother', 'defaultFamily', 3, 'fish_tacos.jpg', FALSE, CURRENT_TIMESTAMP),
    ('Mushroom Risotto', 'Chef Tony', 'defaultFamily', 3, 'mushroom_risotto.jpg', TRUE, CURRENT_TIMESTAMP),
    ('Stuffed Peppers', 'Sister', 'defaultFamily', 3, 'stuffed_peppers.jpg', FALSE, CURRENT_TIMESTAMP),
    ('Apple Pie', 'Grandma', 'defaultFamily', 4, 'apple_pie.jpg', TRUE, CURRENT_TIMESTAMP),
    ('Clam Chowder', 'Dad', 'defaultFamily', 4, 'clam_chowder.jpg', FALSE, CURRENT_TIMESTAMP),
    ('Chicken Alfredo', 'Mom', 'defaultFamily', 4, 'chicken_alfredo.jpg', TRUE, CURRENT_TIMESTAMP),
    ('Greek Salad', 'Chef Alex', 'defaultFamily', 4, 'greek_salad.jpg', FALSE, CURRENT_TIMESTAMP),
    ('Chocolate Cake', 'Aunt Lucy', 'defaultFamily', 5, 'chocolate_cake.jpg', TRUE, CURRENT_TIMESTAMP),
    ('Lamb Chops', 'Chef Gordon', 'defaultFamily', 5, 'lamb_chops.jpg', FALSE, CURRENT_TIMESTAMP),
    ('Vegetable Soup', 'Uncle Sam', 'defaultFamily', 5, 'vegetable_soup.jpg', TRUE, CURRENT_TIMESTAMP),
    ('Shrimp Scampi', 'Cousin Joe', 'defaultFamily', 5, 'shrimp_scampi.jpg', FALSE, CURRENT_TIMESTAMP);
