const express = require("express");

const recipes = express.Router();

// const verifyToken = require("../middlewares/authMiddleware");

const {
  getAllPublicRecipes,
  createRecipe,
  recipesById,
} = require("../queries/recipes");

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

// To get ALL of the Recipes that the user created
recipes.get("/:user_id", async (req, res) => {
  const { user_id } = req.params;

  try {
    const recipes = await recipesById(user_id);
    if (recipes) {
      console.log(recipes);
      res.status(200).json([...recipes]);
    } else {
      res.status(404).json({ error: "Recipes with this ID was not found" });
    }
  } catch (error) {
    res.status(500).json({ error: "Server error" });
  }
});

// recipes.get("/recipes/:user_id", verifyToken, async (req, res) => {
//   const userId = req.userId;

//   try {
//     const recipes = await recipesById(userId);
//     if (recipes) {
//       console.log(recipes);
//       res.status(200).json(recipes);
//     } else {
//       res.status(404).json({ error: "No recipes found for this user" });
//     }
//   } catch (error) {
//     res.status(500).json({ error: "Server error" });
//   }
// });

module.exports = recipes;
