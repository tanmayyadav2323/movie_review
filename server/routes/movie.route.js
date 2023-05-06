const express = require("express");
const movieRouter = express.Router();
const Review = require("../models/review.model");
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
                movieId: req.body.movieId,
                description: req.body.desciption,
                spoiler: req.body.spolier,
                userReview: req.body.userReview,
                comments: req.body.comments
            }
        );

        await review.save();

        let movieId = req.body.movieId;
        let movie = await Movie.findOne({});

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

module.exports = movieRouter;