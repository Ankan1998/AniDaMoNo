const mongoose = require('mongoose')

const AnimeSchema = new mongoose.Schema({
    anime_id: {
        type: Number,
        required: true,
    },

    watched: {
        type: Boolean
    },
    waitlist: {
        type: Number
    },
    owner: {
        type: mongoose.Schema.Types.ObjectId,
        required: true,

    }
}, {
    timestamps: true
})

const animes = mongoose.model('Anime', AnimeSchema)

module.exports = animes