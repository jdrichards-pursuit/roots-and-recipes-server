const express = require("express");

const recipes = express.Router();

const { getAllPublicRecipes } = require("../queries/recipes");

recipes.get("/", async (req, res) => {
  try {
    const allPublicRecipes = await getAllPublicRecipes();

    res.status(200).json(allPublicRecipes);
  } catch (error) {
    res.status(500).json({ error: "server error" });
  }
});

module.exports = recipes;
