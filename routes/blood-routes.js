const express = require("express");
const router = express.Router();
const bloodController = require("../controllers/blood-controller");
const { verifyUser } = require("../middlewares/auth");
const upload = require("../middlewares/uploads");
const uploads =require("../middlewares/multer")

router
  .route("/")
  
  // .post(bloodController.createBlood)
  .put((req, res) => res.status(405).json({ message: "Method not allowed" }))
  .delete((req, res) =>
    res.status(405).json({ message: "Method not allowed" })
  );

router.post("/create",uploads.array("contentImg"),bloodController.createBlood);
router.get("/getblood",bloodController.getblood)
router.post(
  "/uploadBloodCover",
  verifyUser,
  upload,
  bloodController.uploadBloodCover
);

// Get bloods uploaded by the current user
router.get(
  "/uploaded-by-current-user",
  verifyUser,
  bloodController.getBloodsUploadedByCurrentUser
);

// Get bloods by user id
router.get("/user/:user_id", bloodController.getBloodsByUserId);

// Search bloods
router.get("/search", bloodController.searchBloods);

// Search Users
router.get("/searchUser", bloodController.searchUsers);

// Get all bookmarked bloods
router.get("/bookmarked-bloods", bloodController.getBookmarkedBloods);

router
  .route("/:blood_id")
  .get(bloodController.getBloodById)
  .post((req, res) => {
    res.status(405).json({ error: "POST request is not allowed" });
  })
  .put(bloodController.updateBloodById)
  .delete(bloodController.deleteBloodById);

// Bookmark a blood
router.post("/bookmark/:blood_id", bloodController.bookmarkBlood);

// Remove bookmark from a blood
router.delete("/bookmark/:blood_id", bloodController.removeBookmark);

// get users with most bloods sorted in descending order
router.get("/users", bloodController.getAllUsers);

module.exports = router;
