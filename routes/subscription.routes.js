const router = require("express").Router();
const auth = require("../middlewares/auth.middleware");
const subscription = require("../controllers/subscription.controller");

router.post("/", auth, subscription.createSubscription);
router.get("/my", auth, subscription.mySubscriptions);

module.exports = router;
