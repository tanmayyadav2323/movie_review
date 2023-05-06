const express = require("express");
const movieRouter = express.Router();



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

module.exports = movieRouter;