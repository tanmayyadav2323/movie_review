
const { model, Schema } = require("mongoose");

const reviewSchema = new Schema(
    {
        movieId: {
            type: String,

        },

        description: {
            type: String,

        },

        spoiler: {
            type: Boolean,

        },

        userReview: {
            type: Boolean,

        },

        comments: [
            {
                type: String,
            },
        ],
    },
    { timestamps: true }
);


module.exports = model("Review", reviewSchema);