const db = require("../db/dbConfig");

//HOME PG
//Grabs all public recipes
//Grab one recipe

// VIEW ALL PUBLIC RECIPES
const getAllPublicRecipes = async () => {
  try {
    const query = "SELECT * FROM recipes WHERE status = $1";

    const recipes = await db.any(query, "TRUE");

    return recipes;
  } catch (error) {
    console.error("Error:", error);
    throw error;
  }
};

// CREATE NEW RECIPE
const createRecipe = async (recipe) => {
  // console.log(recipe);

  const { name, family, chef, status, user_id, photo, ingredients, steps } =
    recipe;

  try {
    const query =
      "INSERT INTO recipes (name, family, chef, status, user_id, photo, ingredients, steps) VALUES($1, $2, $3, $4, $5, $6, $7, $8) RETURNING *";

    const newRecipe = await db.one(query, [
      name,
      family,
      chef,
      status,
      user_id,
      photo,
      ingredients,
      steps,
    ]);
    console.log("new recipe:", newRecipe);
    return newRecipe;
  } catch (error) {
    return error;
  }
};

// GET RECIPES BASED ON USER ID
const recipesById = async (user_id) => {
  try {
    const query = "SELECT * FROM recipes WHERE user_id=$1";
    const allRecipes = await db.any(query, user_id);
    return allRecipes;
  } catch (error) {
    return error;
  }
};

module.exports = {
  getAllPublicRecipes,
  createRecipe,
  recipesById,
};
