const db = require("../db/dbConfig");

const createNewUser = async (user) => {
  const {
    uid,
    email,
    username,
    first_name,
    last_name,
    password,
    photo,
    nickname,
    role,
    family_code,
    owner,
  } = user;
  // console.log(user);
  try {
    const newUser = await db.one(
      "INSERT INTO users (uid, email, username, first_name, last_name, password, photo, nickname, role, family_code, owner) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11) RETURNING *",
      [
        uid,
        email,
        username,
        first_name,
        last_name,
        password,
        photo,
        nickname,
        role,
        family_code,
        owner,
      ]
    );

    return newUser;
  } catch (error) {
    console.log("Error creating user", error);
  }
};

const findUserByUID = async (uid) => {
  console.log("USERS QUERY UID:", uid);
  try {
    const query = "SELECT * FROM users WHERE uid = $1";

    const user = await db.oneOrNone(query, uid);
    console.log("USERS QUERY USER:", user);
    return user;
  } catch (error) {
    console.error("Error finding User By UID:", error);
    throw error;
  }
};
module.exports = {
  createNewUser,
  findUserByUID,
};
