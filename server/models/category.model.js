
const { model, Schema } = require("mongoose");

const categorySchema = new Schema(
    {
        name:String,
        movies:[{ type: Schema.Types.ObjectId, ref: 'movieview' }],
        title:String,
        image:String
    },
    { timestamps: true }
);


module.exports = model("Category", categorySchema);