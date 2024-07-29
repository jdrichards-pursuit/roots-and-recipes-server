\c rr_db

INSERT INTO families(
family_name, code 
) VALUES('defaultFamily', '000000'),
('Smith Family', '123456');

INSERT INTO users(
     uid, email, username, first_name, last_name, password, photo, nickname, role, family_code, owner, created_at, updated_at
)
VALUES
     ('8EstL4YYNugcL261BVIcouQUO5F3', 'bob@gmail.com', 'bob_bobby', 'Bob', 'Bobby', 'bobbobby', NULL, 'bobby', NULL, '000000', FALSE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
     ('a1eH3ZDmLuVJ7h96X6Iwhdh1WiV2', 'gabby@gmail.com', 'the_gabby', 'Gabby', 'Peterson', 'thegabby', NULL, NULL, 'gabby', '123456', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
     ('Z52Wr4M8FwayqGCXOCyh0LlwOai1', 'mark@gmail.com', 'marker', 'Mark', 'Bell', 'markBell', NULL, 'marky', NULL, '000000', FALSE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
     ('F0EQJKbwWjMgQEEBn4bZF7kjl703', 'john@gmail.com', 'johndoe123', 'John', 'Doe', 'johnDoe', NULL, 'johnny', NULL, '000000', FALSE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
     ('moDIYpnxdhYhGRpfkbiGzP8CUkA3', 'jane@gmail.com', 'janesmith456', 'Jane', 'Smith', 'janeSmith', NULL, 'janie', 'daughter', '123456', FALSE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


  INSERT INTO recipes(
    name, chef, family_id, user_id, photo, status, created_at, ingredients, steps
) VALUES 
    ('Spaghetti Bolognese', 'Uncle John', 1, 1, 'https://res.cloudinary.com/djg5i10dg/image/upload/c_crop,ar_1:1/v1721074568/Spaghetti-and-Meatballs_cpdf8l.jpg', FALSE, CURRENT_TIMESTAMP, '200 grams spaghetti, 250 grams ground beef, 1 cup tomato sauce, 1 piece onion, 2 garlic cloves', 'Cook spaghetti, Cook ground beef, Add tomato sauce, Mix with spaghetti, Serve hot'),
    ('Chicken Curry', 'Auntie Jane', 1, 1, 'https://res.cloudinary.com/djg5i10dg/image/upload/c_crop,ar_1:1/v1721075075/jeer1-720x720_oa7qrr.jpg', TRUE, CURRENT_TIMESTAMP, '500 grams chicken, 1 cup curry sauce, 1 piece onion, 2 garlic cloves, 1 piece ginger', 'Cook chicken, Add curry sauce, Cook onion and garlic, Mix together, Serve hot'),
    ('Beef Stew', 'Grandpa', 1, 1, 'https://res.cloudinary.com/djg5i10dg/image/upload/c_crop,ar_1:1/v1721074677/Slow-Cooker-Beef-Stew-inbowl_symqw9.jpg', TRUE, CURRENT_TIMESTAMP, '500 grams beef, 2 cups beef broth, 3 pieces carrot, 2 pieces potato, 1 piece onion', 'Cook beef, Add beef broth, Add vegetables, Simmer for 2 hours, Serve hot'),
    ('Grilled Salmon', 'Mom', 1, 1, 'https://res.cloudinary.com/djg5i10dg/image/upload/c_crop,ar_1:1/v1721074771/Cilantro-lime-grilled-salmon-6_hgnhj9.jpg', TRUE, CURRENT_TIMESTAMP, '2 pieces salmon, 1 tbsp olive oil, 1 tsp salt, 1 tsp pepper, 1 piece lemon', 'Season salmon, Heat grill, Grill salmon for 5 minutes each side, Squeeze lemon, Serve hot'),
    ('Vegetable Stir Fry', 'Anna Banana', 1, 1, 'https://res.cloudinary.com/djg5i10dg/image/upload/c_crop,ar_1:1/v1721074938/broccolistirfry-15_lrfxwm.jpg', TRUE, CURRENT_TIMESTAMP, '1 cup broccoli, 1 cup bell pepper, 1 cup carrot, 1 tbsp soy sauce, 1 tsp garlic', 'Chop vegetables, Heat pan, Add vegetables, Stir fry with soy sauce and garlic, Serve hot'),
    ('Lasagna', 'Dad', 1, 2, 'https://res.cloudinary.com/djg5i10dg/image/upload/c_crop,ar_1:1/v1721075026/Lasagna-12-1200x900_ccgzti.jpg', TRUE, CURRENT_TIMESTAMP, '200 grams lasagna noodles, 300 grams ground beef, 1 cup tomato sauce, 1 cup ricotta cheese, 1 cup mozzarella cheese', 'Cook lasagna noodles, Cook ground beef, Layer noodles with beef and sauce, Add cheeses, Bake for 45 minutes'),
    ('Pancakes', 'Grandma', 1, 2, 'https://res.cloudinary.com/djg5i10dg/image/upload/c_crop,ar_1:1/v1721075119/sourdough-pancakes-23-500x500_b3qhz0.jpg', FALSE, CURRENT_TIMESTAMP, '1 cup flour, 1 cup milk, 1 egg, 1 tbsp sugar, 1 tsp baking powder', 'Mix ingredients, Heat pan, Pour batter, Flip when bubbles form, Serve with syrup'),
    ('Tacos', 'Uncle Mike', 1, 2, 'https://res.cloudinary.com/djg5i10dg/image/upload/c_crop,ar_1:1/v1721076143/Beef-Tacos-768x575_eelmxf.jpg', TRUE, CURRENT_TIMESTAMP, '200 grams ground beef, 1 cup lettuce, 1 cup tomato, 1 cup cheese, 6 taco shells', 'Cook ground beef, Prepare toppings, Fill taco shells, Serve with toppings, Enjoy'),
    ('Caesar Salad', 'Aunt Mary', 1, 2, 'https://res.cloudinary.com/djg5i10dg/image/upload/c_crop,ar_1:1/v1721076216/Homemade-Caesar-Salad-Dressing_iyenwf.jpg', FALSE, CURRENT_TIMESTAMP, '2 cups romaine lettuce, 1/2 cup croutons, 1/4 cup parmesan cheese, 1/4 cup caesar dressing, 1 piece lemon', 'Chop lettuce, Add croutons, Add cheese, Toss with dressing, Squeeze lemon'),
    ('BBQ Ribs', 'Dad', 1, 3, 'https://res.cloudinary.com/djg5i10dg/image/upload/c_crop,ar_1:1/v1721076258/Oven-Baked-Ribs-SpendWithPennies-4_wccfoa.jpg', TRUE, CURRENT_TIMESTAMP, '1 rack ribs, 1 cup BBQ sauce, 1 tsp salt, 1 tsp pepper, 1 tbsp olive oil', 'Season ribs, Preheat grill, Grill ribs, Brush with BBQ sauce, Serve hot'),
    ('Fish Tacos', 'Brother', 1, 3, 'https://res.cloudinary.com/djg5i10dg/image/upload/c_crop,ar_1:1/v1721076317/fish-tacos-index-64ca974954d47.jpg_y0romh.jpg', FALSE, CURRENT_TIMESTAMP, '200 grams fish, 1 cup cabbage, 1/2 cup salsa, 1/4 cup sour cream, 6 taco shells', 'Cook fish, Prepare toppings, Fill taco shells, Serve with toppings, Enjoy'),
    ('Mushroom Risotto', 'Chef Tony', 1, 3, 'https://res.cloudinary.com/djg5i10dg/image/upload/c_crop,ar_1:1/v1721076425/Mushroom-Risotto_7_cdibwk.jpg', TRUE, CURRENT_TIMESTAMP, '200 grams risotto rice, 1 cup mushrooms, 1/2 cup parmesan cheese, 1 cup chicken broth, 1 piece onion', 'Cook rice, Add chicken broth, Cook mushrooms, Mix together, Serve hot'),
    ('Stuffed Peppers', 'Sister', 1, 3, 'https://res.cloudinary.com/djg5i10dg/image/upload/c_crop,ar_1:1/v1721076452/stuffed-peppers-01_shufzn.jpg', FALSE, CURRENT_TIMESTAMP, '4 bell peppers, 200 grams ground beef, 1 cup rice, 1 cup tomato sauce, 1/2 cup cheese', 'Prepare peppers, Cook beef, Mix with rice and sauce, Stuff peppers, Bake for 30 minutes'),
    ('Apple Pie', 'Grandma', 1, 4, 'https://res.cloudinary.com/djg5i10dg/image/upload/c_crop,ar_1:1/v1721076509/best-apple-pie-recipe-from-scratch-8_biocug.jpg', TRUE, CURRENT_TIMESTAMP, '3 cups apples, 1 cup sugar, 1 tsp cinnamon, 1 pie crust, 1 tbsp butter', 'Prepare apples, Mix with sugar and cinnamon, Fill pie crust, Add butter, Bake for 45 minutes'),
    ('Clam Chowder', 'Dad', 1, 4, 'https://res.cloudinary.com/djg5i10dg/image/upload/c_crop,ar_1:1/v1721077419/Clam-Chowder-2_tnwezp.jpg', FALSE, CURRENT_TIMESTAMP, '1 cup clams, 2 cups milk, 1 cup potatoes, 1 piece onion, 1 tbsp butter', 'Cook clams, Add milk, Add potatoes and onion, Simmer, Serve hot'),
    ('Chicken Alfredo', 'Mom', 1, 4, 'https://res.cloudinary.com/djg5i10dg/image/upload/c_crop,ar_1:1/v1721077504/Skinny-Chicken-Fettuccine-Alfredo-Recipe-2_y2thtu.jpg', TRUE, CURRENT_TIMESTAMP, '200 grams chicken, 1 cup pasta, 1/2 cup alfredo sauce, 1/4 cup parmesan cheese, 1 piece garlic', 'Cook chicken, Cook pasta, Add sauce, Mix together, Serve hot'),
    ('Greek Salad', 'Chef Alex', 1, 4, 'https://res.cloudinary.com/djg5i10dg/image/upload/c_crop,ar_1:1/v1721077599/greek-salad-4_dzhbn5.jpg', FALSE, CURRENT_TIMESTAMP, '1 cup cucumber, 1 cup tomato, 1/2 cup feta cheese, 1/4 cup olives, 1 tbsp olive oil', 'Chop vegetables, Add feta and olives, Toss with olive oil, Serve fresh'),
    ('Chocolate Cake', 'Aunt Lucy', 1, 5, 'https://res.cloudinary.com/djg5i10dg/image/upload/c_crop,ar_1:1/v1721077651/best-chocolate-cake-recipe-from-scratch-8-500x500_iv621o.jpg', TRUE, CURRENT_TIMESTAMP, '1 cup flour, 1 cup sugar, 1/2 cup cocoa powder, 1/2 cup butter, 2 eggs', 'Mix ingredients, Preheat oven, Pour batter, Bake for 30 minutes, Serve with frosting'),
    ('Lamb Chops', 'Chef Gordon', 1, 5, 'https://res.cloudinary.com/djg5i10dg/image/upload/c_crop,ar_1:1/v1721077714/Rosemary-Garlic-Marinated-Lamb-Chops-5_xcylj0.jpg', TRUE, CURRENT_TIMESTAMP, '4 lamb chops, 1 tbsp olive oil, 1 tsp rosemary, 1 tsp thyme, 1 piece garlic', 'Season lamb chops, Preheat grill, Grill for 5 minutes each side, Serve hot'),
    ('Vegetable Soup', 'Uncle Sam', 1, 5, 'https://res.cloudinary.com/djg5i10dg/image/upload/c_crop,ar_1:1/v1721077799/instant-pot-vegetable-soup-www.thereciperebel.com-1200-3-of-3_obdppm.jpg', TRUE, CURRENT_TIMESTAMP, '1 cup carrots, 1 cup celery, 1 cup potatoes, 1 cup tomatoes, 2 cups vegetable broth', 'Chop vegetables, Add broth, Simmer, Serve hot'),
    ('Shrimp Scampi', 'Cousin Joe', 1, 5, 'https://res.cloudinary.com/djg5i10dg/image/upload/c_crop,ar_1:1/v1721077897/shrimp-scampi-B_urf98x.jpg', TRUE, CURRENT_TIMESTAMP, '200 grams shrimp, 1/4 cup butter, 1/4 cup white wine, 1 piece garlic, 1 tbsp lemon juice', 'Cook shrimp, Add butter and wine, Add garlic and lemon juice, Serve hot'),
    ('Roast Chicken', 'Chef Emma', 1, 5, 'https://res.cloudinary.com/djg5i10dg/image/upload/c_crop,ar_1:1/v1721077936/roast-chicken-1-22_jwicea.jpg', TRUE, CURRENT_TIMESTAMP, '1 whole chicken, 2 tbsp olive oil, 1 tsp salt, 1 tsp pepper, 1 bunch rosemary', 'Preheat oven, Season chicken, Roast for 90 minutes, Serve hot'),
    ('Vegetable Lasagna', 'Chef Rosa', 1, 5, 'https://res.cloudinary.com/djg5i10dg/image/upload/c_crop,ar_1:1/v1721141289/easy-vegetable-lasagna-primavera-sq-037_ldbi9o.jpg', TRUE, CURRENT_TIMESTAMP, '200 grams lasagna noodles, 1 cup spinach, 1 cup ricotta cheese, 1 cup tomato sauce, 1 cup mozzarella cheese', 'Cook noodles, Layer with spinach and ricotta, Add tomato sauce, Add mozzarella, Bake for 45 minutes'),
    ('Turkey Sandwich', 'Chef Max', 1, 5, 'https://res.cloudinary.com/djg5i10dg/image/upload/c_crop,ar_1:1/v1721078024/eod-turkey-sandwich-5-2_e4uqzu.jpg', TRUE, CURRENT_TIMESTAMP, '2 slices bread, 100 grams turkey, 1 slice cheese, 1 tbsp mayonnaise, 1 leaf lettuce', 'Spread mayonnaise on bread, Add turkey, Add cheese, Add lettuce, Serve fresh');



    INSERT INTO categories (
    category_name
)
VALUES
    (
         'Breakfast'
    ),
    (
         'Lunch'
    ),
    (
         'Dinner'
    ),
    (
         'Vegetarian'
    ),
    (
         'Snacks'
    ),
    (
         'Dessert'
    ),
    (
         'Drinks'
    );


INSERT INTO category_to_recipe (
    recipe_id, category_id
)
VALUES
    (
         1, 3
    ),
    (
         2, 3
    ),
    (
         3, 3
    ),
    (
         4, 2
    ),
    (
         5, 2
    ),
    (
         6, 3
    ),
    (
         7, 1
    ),
    (
         8, 2
    ),
    (
         9, 3
    ),
    (
         10, 2
    ),
    (
         11, 3
    ),
    (
         12, 2
    ),
    (
         13, 2
    ),
    (
         14, 3
    ),
    (
         15, 2
    ),
    (
         16, 2
    ),
    (
         17, 3
    ),
    (
         18, 2
    ),
    (
         19, 6
    ),
    (
         20, 3
    ),
    (
         21, 3
    );