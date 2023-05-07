
const { model, Schema } = require("mongoose");

const reviewSchema = new Schema(
    {

        movieId: {
            type: String,

        },
        title: {
            type: String,

        },
        name: {
            type: String,
        },
        url: {
            type: String
        }
        ,
        userId: {
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

        likes: [
            {
                type: String
            }
        ],

        dislikes: [
            {
                type: String
            }
        ],

        comments: [
            {
                type: String,
            },
        ],
    },
    { timestamps: true }
);


module.exports = model("Review", reviewSchema);