const express = require("express");

const categories = express.Router();

const {
  grabAllCategories,
  createCategoryEntry,
  grabCategoriesBasedOnRecipeID,
} = require("../queries/categories");

//To get all categories
categories.get("/", async (req, res) => {
  try {
    const allCategories = await grabAllCategories();

    res.status(200).json(allCategories);
  } catch (error) {
    res.status(500).json({ error: "server error" });
  }
});

//To create category entry
categories.post("/:recipe_id/:category_id", async (req, res) => {
  const { recipe_id, category_id } = req.params;

  try {
    const newEntry = await createCategoryEntry(recipe_id, category_id);

    res.status(200).json(newEntry);
    console.log(`Categories Added!`);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
});

categories.get("/recipes/:recipe_id", async (req, res) => {
  const { recipe_id } = req.params;

  try {
    const categories = await grabCategoriesBasedOnRecipeID(recipe_id);

    res.status(200).json(categories);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
});

module.exports = categories;
