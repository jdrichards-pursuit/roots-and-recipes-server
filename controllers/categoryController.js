const express = require("express");

const categories = express.Router();

const {
  grabAllCategories,
  createCategoryEntry,
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
  console.log("body", req.body);
  const { recipe_id, category_id } = req.body;

  try {
    const newEntry = await createCategoryEntry(req.body);

    res.status(200).json(newEntry);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
});

module.exports = categories;
