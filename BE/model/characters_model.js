const mongoose = require('mongoose')

const CharactersSchema = new mongoose.Schema({
    character_id: {
        type: Number,
        required: true,
    },
    owner: {
        type: mongoose.Schema.Types.ObjectId,
        required: true,

    }
}, {
    timestamps: true
})

const characters = mongoose.model('Character', CharactersSchema)

module.exports = characters