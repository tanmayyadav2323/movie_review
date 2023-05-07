const { model, Schema } = require("mongoose");


const directorSchema = new Schema(
    {
        name:String,
        movie:[Schema.Types.ObjectId]
    },
    { timestamps: true }
);

module.exports = model("Director", directorSchema);


