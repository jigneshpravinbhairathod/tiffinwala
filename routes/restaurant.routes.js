const router = require("express").Router();
const auth = require("../middlewares/auth.middleware");
const restaurant = require("../controllers/restaurant.controller");

router.post("/", auth, restaurant.createRestaurant);
router.get("/", restaurant.getAllRestaurants);

module.exports = router;
