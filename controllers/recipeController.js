const express = require("express");

const recipes = express.Router();

const { getAllPublicRecipes, createRecipe } = require("../queries/recipes");

// To get ALL PUBLIC recipes
recipes.get("/", async (req, res) => {
  try {
    const allPublicRecipes = await getAllPublicRecipes();

    res.status(200).json(allPublicRecipes);
  } catch (error) {
    res.status(500).json({ error: "server error" });
  }
});

// To create a NEW RECIPE
recipes.post("/", async (req, res) => {
  console.log("body", req.body);

  try {
    const newRecipe = await createRecipe(req.body);
    console.log("new recipe:", newRecipe);
    res.status(200).json(newRecipe);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
});

module.exports = recipes;
