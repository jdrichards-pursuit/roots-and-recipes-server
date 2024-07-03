-- db/schema.sql
DROP DATABASE IF EXISTS rr_db;
CREATE DATABASE rr_db;

\c rr_db;

CREATE TABLE families(
    id SERIAL PRIMARY KEY,
    family_name VARCHAR(50) NOT NULL UNIQUE,
    code VARCHAR(20) UNIQUE
);


CREATE TABLE users (
    id SERIAL PRIMARY KEY ,
    uid VARCHAR(255),
    email VARCHAR(100),
    username VARCHAR(100),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    photo VARCHAR(100),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE recipes(
id SERIAL PRIMARY KEY,
name VARCHAR(50),
chef VARCHAR(50),
family VARCHAR(50) REFERENCES families(family_name),
user_id INTEGER REFERENCES users(id),
photo VARCHAR(100),
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE favorites(
id SERIAL PRIMARY KEY,
recipe_id INTEGER REFERENCES recipes(id),
user_id INTEGER REFERENCES users(id)
);

CREATE TABLE categories(
   id SERIAL PRIMARY KEY,
category_name VARCHAR(50) UNIQUE
);

CREATE TABLE category_to_recipe(
    id SERIAL PRIMARY KEY,
recipe_id INTEGER REFERENCES recipes(id),
category_name VARCHAR(50) REFERENCES categories(category_name)
);

CREATE TABLE ingredients(
    id SERIAL PRIMARY KEY,
   recipe_id INTEGER REFERENCES recipes(id),
name VARCHAR(50),
quantity VARCHAR(10),
unit VARCHAR(10)
);

CREATE TABLE steps(
id SERIAL PRIMARY KEY,
 recipe_id INTEGER REFERENCES recipes(id),
step VARCHAR(100)
);

CREATE TABLE notes(
    id SERIAL PRIMARY KEY,
note TEXT,
step_id INTEGER REFERENCES steps(id),
voice_notes TEXT
);