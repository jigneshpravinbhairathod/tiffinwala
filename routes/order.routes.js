const router = require("express").Router();
const auth = require("../middlewares/auth.middleware");
const order = require("../controllers/order.controller");

router.post("/skip", auth, order.skipTiffin);

module.exports = router;
