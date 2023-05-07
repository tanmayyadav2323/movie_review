const mongoose = require('mongoose');

const movieSchema = new mongoose.Schema({
    title: { type: String, required: true },
    releaseDate: { type: String, required: true },
    summary: { type: String, required: true },
    genre: [{ type: String }],
    language: { type: String, required: true },
    rating: { type: Number, default: null },
    runtime: { type: Number, required: true },
    videos: [{ type: String }],
    photos: [{ type: String }],
    awards: [{ type: String }],
    cast: [
        {
            name: { type: String, required: true },
            photo: { type: String },
        },
    ],
    director: [
        {
            name: { type: String, required: true },
            photo: { type: String },
        },
    ],
    writers: [
        {
            name: { type: String, required: true },
            photo: { type: String },
        },
    ],
    budget: { type: String, required: true },
    boxOfficeCollection: { type: String, required: true },
    region: { type: String, required: true },
    ratedBy: [{ id: { type: mongoose.Schema.Types.ObjectId, ref: 'Users' }, rating: Number }],
    reviewIds: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Review' }],
    storyline: [String]
}, {
    collection: 'movies'
});

const Movie = mongoose.model('movies', movieSchema);

module.exports = Movie;
