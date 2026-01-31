const db = require("../config/db");

exports.createRestaurant = (req, res) => {
  const { name, address } = req.body;

  db.query(
    "INSERT INTO restaurants (owner_id, name, address) VALUES (?,?,?)",
    [req.user.phone, name, address],
    () => res.json({ message: "Restaurant created" })
  );
};

exports.getAllRestaurants = (req, res) => {
  db.query("SELECT * FROM restaurants", (err, rows) => {
    res.json(rows);
  });
};
