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

// get Characters according to User
router.get('/characters', auth, async (req, res) => {
    try {
        await req.user.populate({
            path: 'character_virtuals',
        })
        res.status(200).send(req.user.character_virtuals)

    } catch (e) {
        res.status(400).send()
    }
})

// Delete an Character
router.delete('/characters/delete/:id', auth,async (req, res) => {
    try {
        const delCount = await Character.deleteOne({_id:req.params.id,owner:req.user._id})
        if(delCount.deletedCount===0){
            return res.status(400).send()
        }
        res.status(200).send()
    } catch (e) {
        res.status(500).send()
    }
})

// Delete all Characters
router.delete('/characters/deleteAll', auth, async (req, res) => {
    try {
        await Character.deleteMany({owner:req.user._id})
        res.status(200).send()

    } catch (e) {
        res.status(400).send()
    }
})
module.exports = router