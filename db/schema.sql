DROP DATABASE IF EXISTS debug_arena;
CREATE DATABASE debug_arena;

\c debug_arena;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    uid VARCHAR(255),
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL UNIQUE,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    nickname VARCHAR(255),
    family_id INTEGER,
    photo BYTEA,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE families (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    code VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE recipes (
    id SERIAL PRIMARY KEY,
    uid VARCHAR(255),
    email VARCHAR(100),
    username VARCHAR(100),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    password VARCHAR(100),
    photo VARCHAR(100),
    nickname VARCHAR(50),
    role VARCHAR(30),
    family_code VARCHAR(20) REFERENCES families(code),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    ingredients VARCHAR(255),
    steps VARCHAR(255)
);

CREATE TABLE ingredients (
    id SERIAL PRIMARY KEY,
    recipe_id INTEGER NOT NULL REFERENCES recipes(id),
    name VARCHAR(255) NOT NULL,
    quantity VARCHAR(255) NOT NULL,
    unit VARCHAR(50) NOT NULL
);

CREATE TABLE steps (
    id SERIAL PRIMARY KEY,
    recipe_id INTEGER NOT NULL REFERENCES recipes(id),
    step TEXT NOT NULL
);

CREATE TABLE notes (
    id SERIAL PRIMARY KEY,
    body TEXT NOT NULL,
    step_id INTEGER NOT NULL REFERENCES steps(id),
    voice_notes_guid VARCHAR(255)
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE favorites (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    recipe_id INTEGER NOT NULL REFERENCES recipes(id)
);

CREATE TABLE category_to_recipe (
    id SERIAL PRIMARY KEY,
    recipe_id INTEGER NOT NULL REFERENCES recipes(id),
    category_id INTEGER NOT NULL REFERENCES categories(id)
);

CREATE TABLE favorites (
    id SERIAL PRIMARY KEY,
    recipe_id INTEGER REFERENCES recipes(id),
    user_id INTEGER REFERENCES users(id)
);

ALTER TABLE users ADD CONSTRAINT fk_family FOREIGN KEY (family_id) REFERENCES families(id);
ALTER TABLE recipes ADD CONSTRAINT fk_family_name FOREIGN KEY (family) REFERENCES families(name);
