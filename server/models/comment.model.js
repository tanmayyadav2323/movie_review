const { model, Schema } = require("mongoose");

const reply = new Schema(
    {
        name: String,
        imageUrl: String,
        userId: String,
        description: String
    },
    { timestamps: true }
);

const comment = new Schema(
    {
        description: String,
        likes: [String],
        dislikes: [String],
        replies: [],
        userId: String,
        name: String,
        imageUrl: String,
    },
    { timestamps: true }
);

module.exports = {
    Comment: model("Comment", comment),
    Reply: model("Reply", reply)
};
