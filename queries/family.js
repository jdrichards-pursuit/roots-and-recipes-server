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
    const query = `UPDATE users SET family_code = $1, role = $2 , owner = $3 WHERE id = $4;`;
    const updatedFamilyCode = await db.result(query, [code, role, "FALSE", id]);
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
    // Step 1: Get the family ID from the families table
    const familyIdQuery = `SELECT id FROM families WHERE family_name = $1;`;
    const familyResult = await db.oneOrNone(familyIdQuery, name);

    if (!familyResult) {
      // No family found with the given name
      return [];
    }

    const familyId = familyResult.id;

    // Step 2: Use the family ID to get recipes from the recipes table
    const recipesQuery = `SELECT * FROM recipes WHERE family_id = $1;`;
    const familyRecipes = await db.any(recipesQuery, familyId);

    return familyRecipes;
  } catch (error) {
    // Handle errors appropriately
    console.error("Error retrieving recipes:", error);
    throw error;
  }
};

const grabAllFamilies = async () => {
  try {
    const query = `SELECT * FROM families;`;
    const families = await db.any(query);
    return families;
  } catch (error) {}
};

//Creates a family
const createFamily = async (name, code, userId) => {
  const queryFamily = `INSERT INTO families (family_name, code) VALUES ($1, $2) RETURNING *`;
  const queryUser = `UPDATE users SET owner = $1, family_code = $2 WHERE id = $3 RETURNING *`;

  try {
    const result = await db.tx(async (t) => {
      const familyEntry = await t.one(queryFamily, [name, code]);
      const userEntry = await t.one(queryUser, ["TRUE", code, userId]);
      return { family: familyEntry, user: userEntry };
    });

    return result;
  } catch (error) {
    console.error("Error creating family and user:", error);
    return error;
  }
};

//leaves a family (set new owner to family)
const ownerLeaveFamily = async (id, memberId) => {
  try {
    const queryOne = `UPDATE users SET owner = FALSE, family_code = '000000' WHERE id = $1`;
    const queryTwo = `UPDATE users SET owner = TRUE WHERE id = $1`;

    await db.tx(async (t) => {
      await t.none(queryOne, [id]);
      await t.none(queryTwo, [memberId]);
    });

    return { message: "Ownership updated successfully" };
  } catch (error) {
    console.error("Error updating owner status:", error);
    throw error;
  }
};

const leaveFamily = async (userId) => {
  try {
    const query = `UPDATE users SET family_code = '000000' WHERE id = $1;`;
    await db.none(query, [userId]);

    return { message: "User successfully removed from family" };
  } catch (error) {
    return error;
  }
};

const updateUserRecords = async (code, userId) => {
  try {
    const queryOne = `UPDATE users SET family_code = '000000' WHERE family_code = $1;`;
    const queryTwo = `UPDATE users SET owner = TRUE WHERE id = $1;`;

    await db.tx(async (t) => {
      await t.none(queryOne, [code]);
      await t.none(queryTwo, [userId]);
    });

    return { message: "User records updated successfully" };
  } catch (error) {
    console.error("Error updating user records:", error);
    throw error;
  }
};

//Deletes a family
const deleteFamily = async (code) => {
  try {
    const queryOne = `UPDATE users SET family_code = $1, owner = $2 WHERE id = $3;`;
    const queryTwo = `DELETE FROM families WHERE code = $1;`;

    await db.tx(async (t) => {
      await t.none(queryOne, ["000000", "FALSE", userId]);
      await t.none(queryTwo, [code]);
    });

    return { message: "User records updated successfully" };

    return { message: "Family deleted successfully" };
  } catch (error) {
    console.error("Error deleting family record:", error);
    throw error;
  }
};

const addRecipeToFamily = async (recipeId, code) => {
  try {
    const familyQuery = `SELECT id, family_name FROM families WHERE code = $1;`;
    const familyResult = await db.one(familyQuery, code);

    if (!familyResult) {
      throw new Error("Family not found.");
    }

    const updateQuery = `UPDATE recipes SET family_id = $1 WHERE id = $2;`;
    await db.none(updateQuery, [familyResult.id, recipeId]);

    return { message: "Recipe successfully added to family" };
  } catch (error) {
    return error;
  }
};

const grabFamilyNameByID = async (id) => {
  try {
    const query = `SELECT family_name FROM families WHERE id = $1`;
    const result = await db.one(query, [id]);

    // Return the family name from the result
    return result.family_name;
  } catch (error) {
    return error;
  }
};

const grabFamilyIDByCode = async (code) => {
  try {
    const query = `SELECT id FROM families WHERE code = $1`;

    return await db.one(query, [code]);
  } catch (error) {
    return error;
  }
};

module.exports = {
  getAllFamilyCodes,
  updateFamilyCodeAndRole,
  grabUsersByfamilyCode,
  grabRecipesByfamilyName,
  grabAllFamilies,
  createFamily,
  ownerLeaveFamily,
  leaveFamily,
  updateUserRecords,
  deleteFamily,
  addRecipeToFamily,
  grabFamilyNameByID,
  grabFamilyIDByCode,
};
