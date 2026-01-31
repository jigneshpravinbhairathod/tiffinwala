const db = require("../config/db");
const jwt = require("jsonwebtoken");
const { generateOTP } = require("../utils/otp");
const { secret, expiresIn } = require("../config/jwt");

const otpStore = {};

exports.sendOTP = (req, res) => {
  const { phone } = req.body;
  const otp = generateOTP();

  otpStore[phone] = otp;
  console.log("OTP:", otp);

  res.json({ message: "OTP sent successfully" });
};

exports.verifyOTP = (req, res) => {
  const { phone, otp, role } = req.body;

  if (otpStore[phone] != otp) {
    return res.status(400).json({ message: "Invalid OTP" });
  }

  db.query(
    "SELECT * FROM users WHERE phone = ?",
    [phone],
    (err, users) => {
      if (users.length === 0) {
        db.query(
          "INSERT INTO users (phone, role) VALUES (?, ?)",
          [phone, role]
        );
      }

      const token = jwt.sign({ phone, role }, secret, {
        expiresIn
      });

      res.json({ token });
    }
  );
};
