const mongoose = require("mongoose");
const Blood = require("../models/Blood");
const User = require("../models/User");



getblood= async(req,res,next)=>{
  try {
    const bloodData = await Blood.find();
    res.status(200).json(bloodData);
  } catch (error) {
    next(error);
  }
 }

// const getAllBloods = async (req, res, next) => {
//   try {
//     const loggedInUserId = req.user.id;
//     const userInfo = await User.findById(loggedInUserId);
//     const bloods = await Blood.find();

//     const otherBloods = bloods.map((blood) => {
//       const isBookmarked = userInfo.bookmarkedBloods.includes(
//         blood.id.toString()
//       );

//       return {
//         ...blood.toObject(),
//         isBookmarked: isBookmarked,
//       };
//     });

//     res.json({
//       data: otherBloods,
//     });
//   } catch (error) {
//     next(error);
//   }
// };


// Get bloods by user id
const getBloodsByUserId = async (req, res, next) => {
  try {
    const userId = req.params.user_id;

    const bloods = await Blood.find({ "user.id": userId }).sort({
      createdAt: -1,
    });

    res.json({
      data: bloods,
    });
  } catch (error) {
    next(error);
  }
};

const createBlood = async (req, res, next) => {
  
  const { title, content ,} = req.body;
  const user = req.user;
 

  try {
    var images=[];
    for(let i=0; i<req.files.length;i++){
      images[i]=req.files[i].filename;

    }

      bloodData = {
      title,
      content,
      contentImg:images,
      user: user,
    };

    const blood = await Blood.create(bloodData);
    res.status(201).json(blood);
  } catch (error) {
    next(error);
  } finally {
    uploadedFilename = undefined; // Reset the shared variable after use
  }
};

const uploadBloodCover = async (req, res, next) => {
  try {
    if (!req.file) {
      return res.status(400).json({ error: "Please upload a file" });
    }

    // Save the book cover image and get the filename
    const filename = req.file.filename;

    uploadedFilename = filename; // Store the filename in the shared variable

    res.status(200).json({ success: true, data: filename });
  } catch (error) {
    next(error);
  }
};

const getBloodById = (req, res, next) => {
  Blood.findById(req.params.blood_id)
    .then((blood) => {
      if (!blood) {
        res.status(404).json({ error: "blood not found" });
      }
      res.json(blood);
    })
    .catch(next);
};

const updateBloodById = (req, res, next) => {
  Blood.findByIdAndUpdate(req.params.blood_id, { $set: req.body }, { new: true })
    .then((updated) => res.json(updated))
    .catch(next);
};

const deleteBloodById = (req, res, next) => {
  Blood.findByIdAndDelete(req.params.blood_id)
    .then((reply) => res.status(204).end())
    .catch(next);
};

const searchBloods = (req, res, next) => {
  const { query } = req.query;

  Blood.find({
    $or: [
      { title: { $regex: query, $options: "i" } },
      // { author: { $regex: query, $options: "i" } },
    ],
  })
    .then((bloods) => {
      if (bloods.length === 0) {
        // No bloods found
        res.json({ message: "No bloods found" });
      } else {
        // Matching bloods found
        res.json(bloods);
      }
    })
    .catch((error) => {
      next(error);
    });
};

const searchUsers = (req, res, next) => {
  const { query } = req.query;

  User.find({
    $or: [
      { username: { $regex: query, $options: "i" } },
      { email: { $regex: query, $options: "i" } },
    ],
  })
    .then((users) => {
      if (users.length === 0) {
        // No users found
        res.json({ message: "No users found" });
      } else {
        // Matching users found
        res.json(users);
      }
    })
    .catch((error) => {
      next(error);
    });
};

const bookmarkBlood = async (req, res, next) => {
  try {
    const userId = req.user.id;
    const bloodId = req.params.blood_id;

    const user = await User.findById(userId);
    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }

    if (user.bookmarkedBloods.includes(bloodId)) {
      return res.status(400).json({ error: "Blood is already bookmarked" });
    }

    user.bookmarkedBloods.push(bloodId);
    await user.save();

    res.json({ message: "Blood bookmarked successfully" });
  } catch (error) {
    next(error);
  }
};

const removeBookmark = async (req, res, next) => {
  try {
    const userId = req.user.id;
    const bloodId = req.params.blood_id;

    const user = await User.findById(userId);
    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }

    if (!user.bookmarkedBloods.includes(bloodId)) {
      return res.status(400).json({ error: "Blood is not bookmarked" });
    }

    user.bookmarkedBloods = user.bookmarkedBloods.filter(
      (bookmark) => bookmark.toString() !== bloodId
    );
    await user.save();

    res.json({ message: "Bloodmark removed successfully" });
  } catch (error) {
    next(error);
  }
};

const getBookmarkedBloods = async (req, res, next) => {
  try {
    const userId = req.user.id;

    const user = await User.findById(userId);
    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }

    const bookmarkedBloods = await Blood.find({
      _id: { $in: user.bookmarkedBloods },
    });

    res.json({ data: bookmarkedBloods });
  } catch (error) {
    next(error);
  }
};

// Get bloods uploaded by current user
const getBloodsUploadedByCurrentUser = async (req, res, next) => {
  try {
    const userId = req.user.id;

    const bloods = await Blood.find({ "user.id": userId }).sort({
      createdAt: -1,
    });

    res.json({
      data: bloods,
    });
  } catch (error) {
    next(error);
  }
};

// get users with most bloods sorted in descending order
const getAllUsers = async (req, res, next) => {
  try {
    // Use aggregation to get all users and count the number of uploaded bloods for each user
    const users = await User.aggregate([
      {
        $lookup: {
          from: "bloods", // The name of the collection for the Blood model
          localField: "_id", // Use the correct local field (_id field in the User model)
          foreignField: "user", // Use the correct foreign field (user field in the Blood model)
          as: "uploadedBloodsData",
        },
      },
      {
        $addFields: {
          uploadedBloodsCount: { $size: "$uploadedBloodsData" },
        },
      },
      {
        $sort: { uploadedBloodsCount: -1 }, // Sort users based on the uploadedBloodsCount in descending order
      },
    ]);

    res.json(users);
  } catch (error) {
    next(error);
  }
};

module.exports = {
  // getAllBloods,
  createBlood,
  uploadBloodCover,
  getBloodById,
  updateBloodById,
  deleteBloodById,
  searchBloods,
  searchUsers,
  getBloodsUploadedByCurrentUser,
  bookmarkBlood,
  removeBookmark,
  getBookmarkedBloods,
  getAllUsers,
  getBloodsByUserId,
  getblood
};
