const express = require("express");
const movieRouter = express.Router();
const Review = require("../models/review.model");
const User = require("../models/user.model");
const Movie = require("../models/movie.model");
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

        res.json({ message: 'Review added successfully.' });

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

module.exports = movieRouter;