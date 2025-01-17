// DEPENDENCIES
const cors = require("cors");
const express = require("express");

const authController = require("./controllers/authController");
const recipeController = require("./controllers/recipeController");
const categoryController = require("./controllers/categoryController");
const familyController = require("./controllers/familyController");

// CONFIGURATION
const app = express();

// MIDDLEWARE
app.use(cors());

app.use((req, _res, next) => {
  // console.log("Origin Requested:", req.headers.origin);
  next();
});

app.use(express.json());

app.use("/api/auth", authController);

app.use("/api/recipes", recipeController);

app.use("/api/categories", categoryController);

app.use("/api/families", familyController);

// ROUTES
app.get("/", (_req, res) => {
  res.send("Welcome to Roots and Recipes");
});

// 404 PAGE
app.get("*", (_req, res) => {
  res.status(404).send("Page not found");
});

// EXPORT
module.exports = app;
