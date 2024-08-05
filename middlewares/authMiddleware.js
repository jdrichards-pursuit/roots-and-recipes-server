const admin = require("firebase-admin");
require("dotenv").config();

const serviceAccount = JSON.parse(
  Buffer.from(process.env.FIREBASE_SERVICE_ACCOUNT, "base64").toString("ascii")
);

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

const authMiddleware = async (req, res, next) => {
  console.log("AUTH MIDDLEWARE HEADER:", req.headers.authorization);
  const token = req.headers.authorization?.split("Bearer ")[1];
  console.log("AUTH MIDDLEWARE TOKEN", token);
  if (!token) return res.status(401).send("No token provided");

  try {
    const decodedToken = await admin.auth().verifyIdToken(token);

    req.user = decodedToken;

    next(); //this happens if everrything passes
  } catch (error) {
    res.status(403).json({ message: "Invalid Token" });
  }
};

module.exports = authMiddleware;
