
const { model, Schema } = require("mongoose");

const userSchema = new Schema(
  {
    phone: {
      type: String,
      trim: true,
      unique: true,
    },

    email: {
      type: String,
      trim: true,
      unique: true,
    },

    name: {
      type: String,

    },

    password: {
      type: String,
      trim: true,
      unique: true,
    },

    imageUrl: {
      type: String,
      trim: true,
      unique: true,
    },

    role: {
      type: String,
      enum: ["ADMIN", "USER"],
      default: "USER",
    },
    description: String,
    phoneOtp: String,
  },
  { timestamps: true }
);

module.exports = model("User", userSchema);