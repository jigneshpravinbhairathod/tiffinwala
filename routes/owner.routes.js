const router = require("express").Router();
const auth = require("../middlewares/auth.middleware");
const role = require("../middlewares/role.middleware");
const owner = require("../controllers/owner.controller");

router.get("/dashboard", auth, role("OWNER"), owner.dashboard);

module.exports = router;
