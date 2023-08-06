const mongoose = require('mongoose');

const userBloodRequestSchema = new mongoose.Schema({
    user: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'User',
      required: true
    },
    bloodType: {
      type: String,
      required: true,
      enum:['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-']
    },
    quantity: {
      type: Number,
      required: true
    },
    hospital: {
      type: mongoose.Schema.Types.Mixed,
      required: true
    },
    location: {
      type: {
        type: String,
        enum: ['Point'],
        required: true
      },
      coordinates: {
        type: [Number],
        required: true
      }
    },
    urgency: {
      type: String,
      required: true,
      enum: [
        'Normal',
        'Critical'
        ]
    },
    datetimeRequested: {
      type: Date,
      required: true,
    },
    donor: {
      type: mongoose.Schema.Types.ObjectId, 
      ref: 'User',
      required: false,
    },
    datetimeDonated: {
      type: Date,
      required: false,
    },
    status: {
      type: String,
      default: 'Not Accepted',
      enum: [
        'Not Accepted',
        'Pending',
        'Donated',
      ]
    }
  
}, {timestamps:true});

userBloodRequestSchema.index({ location: '2dsphere' });

const UserBloodRequest = mongoose.model('UserBloodRequest', userBloodRequestSchema);
module.exports = UserBloodRequest;