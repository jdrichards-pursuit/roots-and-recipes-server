const express = require("express");

const families = express.Router();

const {
  getAllFamilyCodes,
  updateFamilyCodeAndRole,
  grabUsersByfamilyCode,
  grabRecipesByfamilyName,
  grabAllFamilies,
} = require(`../queries/family`);

//Get all family codes
families.get("/codes", async (req, res) => {
  try {
    const allFamilyCodes = await getAllFamilyCodes();
    res.status(200).json(allFamilyCodes);
  } catch (error) {
    return error;
  }
});

//Update family code and role in family
families.put("/codes/update/:family_code/:role/:id", async (req, res) => {
  const { family_code, role, id } = req.params;
  try {
    const updatedFamilyCode = await updateFamilyCodeAndRole(
      family_code,
      role,
      id
    );
    res.status(200).json(updatedFamilyCode);
  } catch (error) {
    return error;
  }
});

//Grab users who have the same family code (family members)
families.get(`/users/:family_code`, async (req, res) => {
  const { family_code } = req.params;
  try {
    const users = await grabUsersByfamilyCode(family_code);
    res.status(200).json(users);
  } catch (error) {
    return error;
  }
});

//Grab users who have the same family name
families.get(`/recipes/:family_name`, async (req, res) => {
  const { family_name } = req.params;
  try {
    const recipes = await grabRecipesByfamilyName(family_name);
    res.status(200).json(recipes);
  } catch (error) {
    return error;
  }
});

//grab all families
families.get(`/`, async (req, res) => {
  try {
    const families = await grabAllFamilies();
    res.status(200).json(families);
  } catch (error) {
    return error;
  }
});
module.exports = families;
