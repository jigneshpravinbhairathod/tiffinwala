const db = require("../config/db");

exports.createSubscription = (req, res) => {
  const { restaurant_id, duration, meal_type, price } = req.body;

  db.query(
    `INSERT INTO subscriptions
     (user_id, restaurant_id, duration, meal_type, price, start_date, end_date, status)
     VALUES (?, ?, ?, ?, ?, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 1 MONTH), 'ACTIVE')`,
    [req.user.phone, restaurant_id, duration, meal_type, price],
    () => res.json({ message: "Subscription activated" })
  );
};

exports.mySubscriptions = (req, res) => {
  db.query(
    "SELECT * FROM subscriptions WHERE user_id = ?",
    [req.user.phone],
    (err, rows) => res.json(rows)
  );
};
