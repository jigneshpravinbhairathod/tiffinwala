const db = require("../config/db");

exports.skipTiffin = (req, res) => {
  const { subscription_id } = req.body;

  db.query(
    "UPDATE orders SET status='SKIPPED' WHERE subscription_id=? AND order_date=CURDATE()",
    [subscription_id],
    () => res.json({ message: "Tiffin skipped" })
  );
};
