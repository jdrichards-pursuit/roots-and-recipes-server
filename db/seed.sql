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
     ('8EstL4YYNugcL261BVIcouQUO5F3', 'bob@gmail.com', 'bob_bobby', 'Bob', 'Bobby', 'bobbobby', NULL, 'bobby', '000000', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
     ('a1eH3ZDmLuVJ7h96X6Iwhdh1WiV2', 'gabby@gmail.com', 'the_gabby', 'Gabby', 'Peterson', 'thegabby', NULL, 'gabby', '000000', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
     ('Z52Wr4M8FwayqGCXOCyh0LlwOai1', 'mark@gmail.com', 'marker', 'Mark', 'Bell', 'markBell', NULL, 'marky', '000000', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
     ('F0EQJKbwWjMgQEEBn4bZF7kjl703', 'john@gmail.com', 'johndoe123', 'John', 'Doe', 'johnDoe', NULL, 'johnny', '000000', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
     ('moDIYpnxdhYhGRpfkbiGzP8CUkA3', 'jane@gmail.com', 'janesmith456', 'Jane', 'Smith', 'janeSmith', NULL, 'janie', '000000', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


   INSERT INTO recipes(
    name, chef, family, user_id, photo, status, created_at, ingredients, steps
) VALUES 
    ('Spaghetti Bolognese', 'Uncle John', 'defaultFamily', 1, 'spaghetti.jpg', FALSE, CURRENT_TIMESTAMP, '200 grams spaghetti, 250 grams ground beef, 1 cup tomato sauce, 1 piece onion, 2 garlic cloves', 'Cook spaghetti, Cook ground beef, Add tomato sauce, Mix with spaghetti, Serve hot'),
    ('Chicken Curry', 'Auntie Jane', 'defaultFamily', 1, 'chicken_curry.jpg', TRUE, CURRENT_TIMESTAMP, '500 grams chicken, 1 cup curry sauce, 1 piece onion, 2 garlic cloves, 1 piece ginger', 'Cook chicken, Add curry sauce, Cook onion and garlic, Mix together, Serve hot'),
    ('Beef Stew', 'Grandpa', 'defaultFamily', 1, 'beef_stew.jpg', FALSE, CURRENT_TIMESTAMP, '500 grams beef, 2 cups beef broth, 3 pieces carrot, 2 pieces potato, 1 piece onion', 'Cook beef, Add beef broth, Add vegetables, Simmer for 2 hours, Serve hot'),
    ('Grilled Salmon', 'Mom', 'defaultFamily', 1, 'grilled_salmon.jpg', TRUE, CURRENT_TIMESTAMP, '2 pieces salmon, 1 tbsp olive oil, 1 tsp salt, 1 tsp pepper, 1 piece lemon', 'Season salmon, Heat grill, Grill salmon for 5 minutes each side, Squeeze lemon, Serve hot'),
    ('Vegetable Stir Fry', 'Anna Banana', 'defaultFamily', 1, 'veg_stir_fry.jpg', FALSE, CURRENT_TIMESTAMP, '1 cup broccoli, 1 cup bell pepper, 1 cup carrot, 1 tbsp soy sauce, 1 tsp garlic', 'Chop vegetables, Heat pan, Add vegetables, Stir fry with soy sauce and garlic, Serve hot'),
    ('Lasagna', 'Dad', 'defaultFamily', 2, 'lasagna.jpg', TRUE, CURRENT_TIMESTAMP, '200 grams lasagna noodles, 300 grams ground beef, 1 cup tomato sauce, 1 cup ricotta cheese, 1 cup mozzarella cheese', 'Cook lasagna noodles, Cook ground beef, Layer noodles with beef and sauce, Add cheeses, Bake for 45 minutes'),
    ('Pancakes', 'Grandma', 'defaultFamily', 2, 'pancakes.jpg', FALSE, CURRENT_TIMESTAMP, '1 cup flour, 1 cup milk, 1 egg, 1 tbsp sugar, 1 tsp baking powder', 'Mix ingredients, Heat pan, Pour batter, Flip when bubbles form, Serve with syrup'),
    ('Tacos', 'Uncle Mike', 'defaultFamily', 2, 'tacos.jpg', TRUE, CURRENT_TIMESTAMP, '200 grams ground beef, 1 cup lettuce, 1 cup tomato, 1 cup cheese, 6 taco shells', 'Cook ground beef, Prepare toppings, Fill taco shells, Serve with toppings, Enjoy'),
    ('Caesar Salad', 'Aunt Mary', 'defaultFamily', 2, 'caesar_salad.jpg', FALSE, CURRENT_TIMESTAMP, '2 cups romaine lettuce, 1/2 cup croutons, 1/4 cup parmesan cheese, 1/4 cup caesar dressing, 1 piece lemon', 'Chop lettuce, Add croutons, Add cheese, Toss with dressing, Squeeze lemon'),
    ('BBQ Ribs', 'Dad', 'defaultFamily', 3, 'bbq_ribs.jpg', TRUE, CURRENT_TIMESTAMP, '1 rack ribs, 1 cup BBQ sauce, 1 tsp salt, 1 tsp pepper, 1 tbsp olive oil', 'Season ribs, Preheat grill, Grill ribs, Brush with BBQ sauce, Serve hot'),
    ('Fish Tacos', 'Brother', 'defaultFamily', 3, 'fish_tacos.jpg', FALSE, CURRENT_TIMESTAMP, '200 grams fish, 1 cup cabbage, 1/2 cup salsa, 1/4 cup sour cream, 6 taco shells', 'Cook fish, Prepare toppings, Fill taco shells, Serve with toppings, Enjoy'),
    ('Mushroom Risotto', 'Chef Tony', 'defaultFamily', 3, 'mushroom_risotto.jpg', TRUE, CURRENT_TIMESTAMP, '200 grams risotto rice, 1 cup mushrooms, 1/2 cup parmesan cheese, 1 cup chicken broth, 1 piece onion', 'Cook rice, Add chicken broth, Cook mushrooms, Mix together, Serve hot'),
    ('Stuffed Peppers', 'Sister', 'defaultFamily', 3, 'stuffed_peppers.jpg', FALSE, CURRENT_TIMESTAMP, '4 bell peppers, 200 grams ground beef, 1 cup rice, 1 cup tomato sauce, 1/2 cup cheese', 'Prepare peppers, Cook beef, Mix with rice and sauce, Stuff peppers, Bake for 30 minutes'),
    ('Apple Pie', 'Grandma', 'defaultFamily', 4, 'apple_pie.jpg', TRUE, CURRENT_TIMESTAMP, '3 cups apples, 1 cup sugar, 1 tsp cinnamon, 1 pie crust, 1 tbsp butter', 'Prepare apples, Mix with sugar and cinnamon, Fill pie crust, Add butter, Bake for 45 minutes'),
    ('Clam Chowder', 'Dad', 'defaultFamily', 4, 'clam_chowder.jpg', FALSE, CURRENT_TIMESTAMP, '1 cup clams, 2 cups milk, 1 cup potatoes, 1 piece onion, 1 tbsp butter', 'Cook clams, Add milk, Add potatoes and onion, Simmer, Serve hot'),
    ('Chicken Alfredo', 'Mom', 'defaultFamily', 4, 'chicken_alfredo.jpg', TRUE, CURRENT_TIMESTAMP, '200 grams chicken, 1 cup pasta, 1/2 cup alfredo sauce, 1/4 cup parmesan cheese, 1 piece garlic', 'Cook chicken, Cook pasta, Add sauce, Mix together, Serve hot'),
    ('Greek Salad', 'Chef Alex', 'defaultFamily', 4, 'greek_salad.jpg', FALSE, CURRENT_TIMESTAMP, '1 cup cucumber, 1 cup tomato, 1/2 cup feta cheese, 1/4 cup olives, 1 tbsp olive oil', 'Chop vegetables, Add feta and olives, Toss with olive oil, Serve fresh'),
    ('Chocolate Cake', 'Aunt Lucy', 'defaultFamily', 5, 'chocolate_cake.jpg', TRUE, CURRENT_TIMESTAMP, '1 cup flour, 1 cup sugar, 1/2 cup cocoa powder, 1/2 cup butter, 2 eggs', 'Mix ingredients, Preheat oven, Pour batter, Bake for 30 minutes, Serve with frosting'),
    ('Lamb Chops', 'Chef Gordon', 'defaultFamily', 5, 'lamb_chops.jpg', FALSE, CURRENT_TIMESTAMP, '4 lamb chops, 1 tbsp olive oil, 1 tsp rosemary, 1 tsp thyme, 1 piece garlic', 'Season lamb chops, Preheat grill, Grill for 5 minutes each side, Serve hot'),
    ('Vegetable Soup', 'Uncle Sam', 'defaultFamily', 5, 'vegetable_soup.jpg', TRUE, CURRENT_TIMESTAMP, '1 cup carrots, 1 cup celery, 1 cup potatoes, 1 cup tomatoes, 2 cups vegetable broth', 'Chop vegetables, Add broth, Simmer, Serve hot'),
    ('Shrimp Scampi', 'Cousin Joe', 'defaultFamily', 5, 'shrimp_scampi.jpg', FALSE, CURRENT_TIMESTAMP, '200 grams shrimp, 1/4 cup butter, 1/4 cup white wine, 1 piece garlic, 1 tbsp lemon juice', 'Cook shrimp, Add butter and wine, Add garlic and lemon juice, Serve hot');