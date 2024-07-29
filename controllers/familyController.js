const express = require("express");

const families = express.Router();

const {
  getAllFamilyCodes,
  updateFamilyCodeAndRole,
  grabUsersByfamilyCode,
  grabRecipesByfamilyName,
  grabAllFamilies,
  createFamily,
  ownerLeaveFamily,
  updateUserRecords,
  deleteFamily,
  leaveFamily,
  addRecipeToFamily,
  grabFamilyNameByID,
  grabFamilyIDByCode,
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

//Update family code and role and owner in family
families.put("/codes/update/:family_code/:role/:id", async (req, res) => {
  const { family_code, role, id } = req.params;
  try {
    const updatedFamilyCode = await updateFamilyCodeAndRole(
      family_code,
      role,
      id
    );
    console.log(`Family code updated`);
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

//Create family
families.post("/", async (req, res) => {
  const { familyName, code, id } = req.body;
  //   console.log(req.body);
  try {
    const familyEntry = await createFamily(familyName, code, id);
    console.log(`family entry created`, familyEntry);

    res.status(200).json(familyEntry);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
});

//assign new owner to family
families.put("/owner/:user_id/:member_id", async (req, res) => {
  const { user_id, member_id } = req.params;

  try {
    const newOwner = await ownerLeaveFamily(user_id, member_id);
    console.log(`New Owner Assigned`, newOwner);
    res.status(200).json(newOwner);
  } catch (error) {
    return error;
  }
});

//leave family (not owner)
families.put("/:user_id", async (req, res) => {
  const { user_id } = req.params;

  try {
    const familyLeft = leaveFamily(user_id);
    console.log(`FAMILY LEFT`);
    res.status(200).json(familyLeft);
  } catch (error) {
    return error;
  }
});

//updates user family data for delete
families.put(`/delete/:code/:user_id`, async (req, res) => {
  const { code, user_id } = req.params;
  try {
    const updatedRecords = await updateUserRecords(code, user_id);
    console.log(`records updated`);
    res.status(200).json(updatedRecords);
  } catch (error) {
    return error;
  }
});

//Deletes family
families.delete(`/delete/:code`, async (req, res) => {
  const { code } = req.params;

  try {
    const deletedFamily = await deleteFamily(code);
    console.log(`Family DELETED`);
    res.status(200).json(deletedFamily);
  } catch (error) {
    return error;
  }
});

//Add recipe to family
families.put(`/recipe/:recipe_id/:code`, async (req, res) => {
  const { recipe_id, code } = req.params;

  try {
    const addedToFamily = await addRecipeToFamily(recipe_id, code);
    console.log(`Recipe Added to family`);
    res.status(200).json(addedToFamily);
  } catch (error) {
    return error;
  }
});

//Grab family_name by id
families.get(`/name/:user_id`, async (req, res) => {
  const { user_id } = req.params;

  try {
    const familyName = await grabFamilyNameByID(user_id);
    console.log(`Grabbed familyName`, familyName);
    res.status(200).json(familyName);
  } catch (error) {
    return error;
  }
});

//Grab family id by code
families.get(`/id/:code`, async (req, res) => {
  const { code } = req.params;

  try {
    const familyID = await grabFamilyIDByCode(code);
    console.log(`Grabbed family ID`, familyID);
    res.status(200).json(familyID);
  } catch (error) {
    return error;
  }
});
module.exports = families;
