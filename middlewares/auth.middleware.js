const jwt = require("jsonwebtoken");
const { secret } = require("../config/jwt");

module.exports = (req, res, next) => {
  const token = req.headers.authorization;

  if (!token)
    return res.status(401).json({ message: "Token required" });

  jwt.verify(token, secret, (err, decoded) => {
    if (err)
      return res.status(403).json({ message: "Invalid token" });

    req.user = decoded;
    next();
  });
};
