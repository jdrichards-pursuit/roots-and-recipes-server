const db = require("../db/dbConfig");

//BACKEND
//Query that grabs all categories from categories table.
//Query that creates a category-to-recipe entry

//FRONTEND
//fetch for the category_name for each category.
//Set those names into an array state called categoryNames
//In our form in the return statement we have to map through that state and return an input(?) with the value of each category name.
//Once you click the category name, it will trigger an onclick function that adds that category name (string) to a state.

const grabAllCategories = async () => {
  try {
    const query = `SELECT id, category_name FROM categories;`;

    const categories = await db.any(query);

    return categories;
  } catch (error) {
    console.error("Error:", error);
    throw error;
  }
};

//CREATES AN ENTRY INTO THE category-to-recipe table
const createCategoryEntry = async (recipe_id, category_id) => {
  try {
    const query =
      "INSERT INTO category_to_recipe (recipe_id, category_id) VALUES($1, $2) RETURNING *";

    const newEntry = await db.one(query, [recipe_id, category_id]);

    return newEntry;
  } catch (error) {
    return error;
  }
};

const grabCategoriesBasedOnRecipeID = async (recipe_id) => {
  try {
    const query = `SELECT c.* FROM categories c JOIN category_to_recipe ctr ON c.id = ctr.category_id WHERE ctr.recipe_id = $1; `;

    const categories = await db.any(query, [recipe_id]);
    return categories;
  } catch (error) {
    return error;
  }
};

module.exports = {
  grabAllCategories,
  createCategoryEntry,
  grabCategoriesBasedOnRecipeID,
};
