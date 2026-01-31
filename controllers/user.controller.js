const db = require("../config/db");

exports.getProfile = (req, res) => {
  db.query(
    "SELECT * FROM users WHERE phone = ?",
    [req.user.phone],
    (err, result) => {
      res.json(result[0]);
    }
  );
};
