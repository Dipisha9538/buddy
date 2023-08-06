const mongoose = require('mongoose')
// const BloodType = require("./Blood");
const Schema = mongoose.Schema

const userSchema = new mongoose.Schema({
    profileImage: {
        type: String,
        // default: null,
    },
    email: {
        type: String,
        required: true,
        unique: [true, 'This email is already registered'],
    },
    password: {
        type: String,
        required: true
    },
    fname: {
        type: String,
        required: true
    },
    gender: {
        type: String,
        enum: ["Male", "Female", "Other"]
    },
    bloodType: {
        type: String,
        enum:['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-']
    },
    phone: {
        type: String,
    },
    Location: {
        type: String,
    },
    canDonate: {
        type: Boolean,
        default: true
    },
    donationRecords:[{
        type: mongoose.Schema.Types.ObjectId,
        ref: 'UserBloodRequest'
    }],
    requestRecords:[{
        type: mongoose.Schema.Types.ObjectId,
        ref: 'UserBloodRequest'
    }],
}
)

// set toJSON method to not to return hashed password
userSchema.set('toJSON', {
    transform: (document, returnedDocument) => {
        returnedDocument.id = document._id.toString()
        delete returnedDocument._id
        delete returnedDocument.password
        delete returnedDocument.__v
    }
})
module.exports = new mongoose.model('User', userSchema)