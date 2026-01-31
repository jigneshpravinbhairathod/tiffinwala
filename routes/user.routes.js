const router = require("express").Router();
const auth = require("../middlewares/auth.middleware");
const user = require("../controllers/user.controller");

router.get("/profile", auth, user.getProfile);

module.exports = router;
