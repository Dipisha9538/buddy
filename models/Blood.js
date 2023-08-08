const mongoose = require("mongoose");
const User = require("./User");
// const Comment = require("./comment");

// Define the Blog schema
const bloodSchema = new mongoose.Schema({
  title: {
    type: String,
    required: true,
  },
  content: {
    type: String,
    required: true,
  },
  contentImg: {
    type: Array,
    // required: [true, "Please upload an image"],
  },
  // date: {
  //   type: Date,
  //   default: Date.now,
  // },
  user: {
    type: mongoose.Schema.Types.Mixed,
    ref: "User",
    // required: true
  },
  // bloodCover: {
  //   type: String,
  //   required: [true, "Please upload a cover image"],
  // },
  // comments: [
  //   {
  //     type: mongoose.Schema.Types.ObjectId,
  //     ref: "Comment",
  //   },
  // ],

  // user: [userSchema]
});

// Create the Blood model
const Blood = mongoose.model("Blood", bloodSchema);

module.exports = Blood;
