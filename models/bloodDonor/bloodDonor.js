const mongoose = require("mongoose");
const bloodDonor = new mongoose.Schema({
    fullName: {
        type: String,
        required: [true, "FullName is required"]
    },
    address: {
        type: String,
        required: [true, "Address is required"]
    },
    bloodGroup: {
        type: String,
        required: [true, "BloodGroup is required"]
    },
    gender: {
        type: String,
        required: [true, "gender is required"]
    },
    dob: {
        type: String,
        required: [true, "dob is required"]
    },
    phone: {
        type: String,
        required: [true, "phone is required"]
    },
    image: {
        type: String,
        required: [true, "Image is required"]
    },
    user: {
        type: mongoose.Schema.ObjectId,
        ref: "User",
        required: true,
    },

    telNo: {
        type: String,

    }
})
module.exports = mongoose.model("BloodDonor", bloodDonor);