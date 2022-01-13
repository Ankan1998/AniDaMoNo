const express = require('express')
require('../../mongoose')
const Character = require('../../model/characters_model')
const auth = require('../../middleware/middleware')

const router = new express.Router()

router.post('/characters/fav/:id', auth, async(req, res)=>{
    const character = new Character({
        character_id:req.params.id,
        owner: req.user._id
    })
    try{
        await character.save()
        res.status(201).send(character)
    } catch(e){
        res.status(400).send()
    }
})

module.exports = router