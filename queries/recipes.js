const db = require("../db/dbConfig");

//HOME PG
//Grabs all public recipes
//Grab one recipe

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

const createRecipe = async (recipe) => {
  console.log(recipe);

  const { name, family, chef, status } = recipe;

  try {
    const query =
      "INSERT INTO recipes (name, family, chef, status) VALUES($1, $2, $3, $4) RETURNING *";

    const newRecipe = await db.one(query, [name, family, chef, status]);
    console.log("new recipe:", newRecipe);
    return newRecipe;
  } catch (error) {
    return error;
  }
};

module.exports = {
  getAllPublicRecipes,
  createRecipe,
};
