const Comment = require("../models/Comment");
const Blood = require("../models/Blood");

const createComment = async (req, res) => {
  try {
    const { content } = req.body;
    const bloodId = req.params.bloodId;
    const user = req.user;

    const blood = await Blood.findById(bloodId);
    if (!blood) {
      return res.status(404).json({ error: "Blood not found" });
    }

    const comment = new Comment({
      content,
      user,
      bloodId,
      createdAt: Date.now(),
    });

    await comment.save();

    blood.comments.push(comment);
    await blood.save();

    res.status(201).json(comment);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Failed to create comment" });
  }
};

const deleteComment = async (req, res) => {
  try {
    const { id } = req.params;
    const userId = req.user.id;

    // Find the comment by ID
    const comment = await Comment.findById(id);

    // Check if the comment exists
    if (!comment) {
      return res.status(404).json({ error: "Comment not found" });
    }

    // Check if the authenticated user is the owner of the comment
    if (comment.user.id.toString() !== userId) {
      return res
        .status(401)
        .json({ error: "You are not authorized to delete this comment" });
    }

    // Find the blood that contains the comment and remove the comment's ID from the comments array
    const blood = await Blood.findByIdAndUpdate(
      comment.blood,
      { $pull: { comments: id } },
      { new: true }
    );

    // Delete the comment
    const deletedComment = await Comment.findByIdAndRemove(id);

    if (!deletedComment) {
      return res.status(404).json({ error: "Failed to delete comment" });
    }

    res.json({ message: "Comment deleted successfully" });
  } catch (error) {
    res.status(500).json({ error: "Failed to delete comment" });
  }
};

module.exports = {
  createComment,
  deleteComment,
};
