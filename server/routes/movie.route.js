const express = require("express");
const movieRouter = express.Router();
const Review = require("../models/review.model");
const User = require("../models/user.model");
const Movie = require("../models/movie.model");
const { Comment, Reply } = require("../models/comment.model");
const MongoClient = require('mongodb').MongoClient;


movieRouter.get("/api/trending-movies", async (req, res, next) => {
    try {
        const client = await MongoClient.connect(process.env.MONGODB_URI, { useNewUrlParser: true });
        const db = client.db("test");
        const collection = db.collection('trending');
        const results = await collection.find({}).toArray();
        res.json(results);
        client.close();
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

movieRouter.post("/api/review-movie", async (req, res, next) => {
    try {


        let review = new Review(
            {
                title: req.body.title,
                movieId: req.body.movieId,
                description: req.body.desciption,
                spoiler: req.body.spolier,
                userReview: req.body.userReview,
                comments: req.body.comments,
                userId: req.body.userId,
                name: "",
                url: "",
            }
        );

        await review.save();

        let movieId = req.body.movieId;
        let movie = await Movie.findById(movieId);

        if (!movie) {
            return res.status(404).json({ message: 'Movie not found.' });
        }

        movie.reviewIds.push(review._id);
        await movie.updateOne({ reviewIds: movie.reviewIds });
        console.log(review);
        res.json(review);

    } catch (e) {
        console.log(e);
        res.status(500).json({ error: e.message });
    }
});

movieRouter.post("/api/find-review", async (req, res, next) => {
    try {
        const reviewIds = req.body.reviewIds;
        const reviews = await Promise.all(
            reviewIds.map(async (reviewId) => {
                console.log(reviewId);
                const review = await Review.findById(reviewId);
                const user = await User.findById(review.userId);
                review.url = user.imageUrl ?? "";
                review.name = user.name ?? "";
                return review;
            })
        );
        res.json(reviews);
    } catch (e) {
        console.log(e);
        res.status(500).json({ error: e.message });
    }
});

movieRouter.post("/api/comment", async (req, res, next) => {
    try {
        const reviewId = req.body.reviewId;
        let review = await Review.findById(reviewId);
        let comment = new Comment(
            {
                description: req.body.description,
                likes: req.body.likes,
                dislikes: req.body.dislikes,
                replies: req.body.replies,
                userId: req.body.userId,
                name: req.body.name,
                imageUrl: req.body.imageUrl,
            }

        );

        await comment.save();
        review.comments.push(comment._id);
        await review.save();
        res.json(comment);
    } catch (e) {
        console.log(e);
        res.status(500).json({ error: e.message });
    }
});

movieRouter.post("/api/find-comment", async (req, res, next) => {
    try {
        const reviewId = req.body.reviewId;
        let review = await Review.findById(reviewId);
        // Get all comments for the review
        const comments = await Comment.find({
            _id: { $in: review.comments },
        });
        comments.forEach(async (comment) => {
            const user = await User.findById(comment.userId);
            comment.url = user.imageUrl ?? "";
            comment.name = user.name ?? "";
            await comment.save();
        });

        res.json(comments);
    } catch (e) {
        console.log(e);
        res.status(500).json({ error: e.message });
    }
});

movieRouter.post("/api/update-comment", async (req, res, next) => {
    try {
        const id = req.body.id;
        let comment = await Comment.findById(id);
        comment.description = req.body.description;
        comment.likes = req.body.likes;
        comment.dislikes = req.body.dislikes;
        // const replies = req.body.replies.map(reply => {

        //     const newReply = new Reply({
        //         description: reply.description,
        //         userId: reply.userId,
        //         name: reply.name,
        //         imageUrl: reply.imageUrl,
        //     });
        //     console.log(newReply);
        //     return newReply;

        // });
        comment.replies = req.body.replies;
        comment.userId = req.body.userId;
        const user = await User.findById(comment.userId);
        comment.url = user.imageUrl ?? "";
        comment.name = user.name ?? "";
        await comment.save();
        res.json(comment);
    } catch (e) {
        console.log(e);
        res.status(500).json({ error: e.message });
    }
});

module.exports = movieRouter;