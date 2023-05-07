const express = require("express");
const movieRouter = express.Router();
const Review = require("../models/review.model");
const User = require("../models/user.model");
const Movie = require("../models/movie.model");
const { Comment, Reply } = require("../models/comment.model");
const Category = require("../models/category.model");
const MongoClient = require('mongodb').MongoClient;
const Movieview = require("../models/movieview.model");

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


movieRouter.post("/api/update-review", async (req, res, next) => {
    try {
        const reviewId = req.body.id;
        let review = await Review.findById(reviewId);
        review.likes = req.body.likes;
        review.dislikes = req.body.dislikes;
        await review.save();
        res.json(review);
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


movieRouter.post("/api/add-category", async (req, res, next) => {
    try {
        let category = Category(
            { name: req.body.name, movies: [], image: req.body.image, title: req.body.title }
        );

        category.save();
        res.json(category);
    } catch (e) {
        console.log(e);
        res.status(500).json({ error: e.message });
    }
});

movieRouter.post("/api/add-category-movie", async (req, res, next) => {
    try {
        let category = Category.findOne({ name: req.body.name });
        req.body.movies.forEach(function (movie) {
            category.movies.push(movie);
        });
        category.save();
        res.json(category);
    } catch (e) {
        console.log(e);
        res.status(500).json({ error: e.message });
    }
});



movieRouter.post("/api/add-category-movie", async (req, res, next) => {
    try {
        let category = Category.findOne({ name: req.body.name });
        req.body.movies.forEach(function (movie) {
            category.movies.push(movie);
        });
        category.save();
        res.json(category);
    } catch (e) {
        console.log(e);
        res.status(500).json({ error: e.message });
    }
});

movieRouter.post("/api/add-movie", async (req, res, next) => {
    try {
        const movie = Movie({
            title: req.body.title,
            releaseDate: req.body.releaseDate,
            summary: req.body.summary,
            genre: req.body.genre,
            language: req.body.language,
            rating: req.body.rating,
            runtime: req.body.runtime,
            videos: req.body.videos,
            photos: req.body.photos,
            awards: req.body.awards,
            cast: req.body.cast,
            director: req.body.director,
            writers: req.body.writers,
            budget: req.body.budget,
            boxOfficeCollection: req.body.boxOfficeCollection,
            region: req.body.region,
            ratedBy: req.body.ratedBy,
            reviewIds: req.body.reviewIds,
            storyline: req.body.storyline
        });

        await movie.save();

        const movieview = Movieview({
            title: req.body.title,
            videolink: req.body.videos[0],
            thumbnail: req.body.photos[0],
            detail: movie._id,
        });
        await movieview.save();

        for (let i = 0; i < req.body.genre.length; i++) {
            const category = await Category.findOne({ name: req.body.genre[i] });
            category.movies.push(movieview._id);
            await category.save();
        }

        res.json(movieview);
    } catch (e) {
        console.log(e);
        res.status(500).json({ error: e.message });
    }
});


movieRouter.post("/api/get-category", async (req, res, next) => {
    try {
        const categories = await Category.find().populate('movies');
        res.json(categories);
    } catch (e) {
        console.log(e);
        res.status(500).json({ error: e.message });
    }
});

movieRouter.post("/api/get-movie", async (req, res, next) => {
    try {
        const movie = await Movie.findById(req.body.id).populate("reviewIds");
        res.json(movie);
    } catch (e) {
        console.log(e);
        res.status(500).json({ error: e.message });
    }
});


movieRouter.post("/api/search-movie", async (req, res, next) => {
    try {
        const name = req.body.name;
        const regex = new RegExp(name, 'i');
        const movies = await Movie.find({
            $or: [
                { title: { $regex: regex } },
                { 'cast.name': { $regex: regex } },
                { 'director.name': { $regex: regex } },
            ],
        }).exec();
        res.json(movies);
        console.log(movies);
    } catch (e) {
        console.log(e);
        res.status(500).json({ error: e.message });
    }
});

movieRouter.post("/api/rate-movie", async (req, res, next) => {
    try {
        const movieId = req.body.movieId;
        const userId = req.body.userId;
        const rating = req.body.rating;

        let movie = await Movie.findById(movieId);

        const existingRatingIndex = movie.ratedBy.findIndex(r => r.id.equals(userId));
        if (existingRatingIndex >= 0) {
            movie.ratedBy[existingRatingIndex].rating = rating;
        } else {
            movie.ratedBy.push({ id: userId, rating: rating });
        }

        const ratings = movie.ratedBy.map(r => r.rating);
        const averageRating = ratings.reduce((total, rating) => total + rating, 0) / ratings.length;
        movie.rating = averageRating;
        await movie.save();

        let movieview = await Movieview.findOne({ title: movie.title });

        if (movieview) {
            movieview.rating = averageRating;
            await movieview.save();
        }
        res.json({});
    } catch (e) {
        console.log(e);
        res.status(500).json({ error: e.message });
    }
});


module.exports = movieRouter;