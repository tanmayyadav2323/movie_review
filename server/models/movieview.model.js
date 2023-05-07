const mongoose = require('mongoose');

const movieviewSchema = new mongoose.Schema({
    title: { type: String, required: true },
    videolink: String,
    thumbnail: String,
    rating: Number,
    detail: mongoose.Schema.Types.ObjectId
}, {
    collection: 'movieview'
});

const Movie = mongoose.model('movieview', movieviewSchema);

module.exports = Movie;
