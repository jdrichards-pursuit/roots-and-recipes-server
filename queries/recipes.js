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

module.exports = {
  getAllPublicRecipes,
};
