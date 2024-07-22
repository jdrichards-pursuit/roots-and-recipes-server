const db = require("../db/dbConfig");

//get all family codes
const getAllFamilyCodes = async () => {
  try {
    const query = `SELECT family_code FROM users;`;
    const familyCodes = await db.any(query);
    return familyCodes;
  } catch (error) {
    return error;
  }
};

//update family code
const updateFamilyCodeAndRole = async (code, role, id) => {
  try {
    const query = `UPDATE users SET family_code = $1, role = $2 WHERE id = $3;`;
    const updatedFamilyCode = await db.result(query, [code, role, id]);
    return updatedFamilyCode;
  } catch (error) {
    return error;
  }
};

//grab users by family code
const grabUsersByfamilyCode = async (code) => {
  try {
    const query = `SELECT * FROM users WHERE family_code = $1;`;
    const familyMembers = await db.any(query, code);
    return familyMembers;
  } catch (error) {
    return error;
  }
};

//grab recipes by family name
const grabRecipesByfamilyName = async (name) => {
  try {
    const query = `SELECT * FROM recipes WHERE family = $1;`;
    const familyRecipes = await db.any(query, name);
    return familyRecipes;
  } catch (error) {
    return error;
  }
};

const grabAllFamilies = async () => {
  try {
    const query = `SELECT * FROM families;`;
    const families = await db.any(query);
    return families;
  } catch (error) {}
};

module.exports = {
  getAllFamilyCodes,
  updateFamilyCodeAndRole,
  grabUsersByfamilyCode,
  grabRecipesByfamilyName,
  grabAllFamilies,
};
