const express = require('express')
require('../../mongoose')
const Anime = require('../../model/anime_model')
const auth = require('../../middleware/middleware')

const router = new express.Router()

router.post('/animes/save/:id', auth, async(req, res)=>{
    const anime = new Anime({
        anime_id:req.params.id,
        owner: req.user._id
    })
    try{
        await anime.save()
        res.status(201).send(anime)
    } catch(e){
        res.status(400).send()
    }
})

// get anime according to User
router.get('/animes', auth, async (req, res) => {
    try {
        await req.user.populate({
            path: 'anime_virtuals',
        })
        res.status(200).send(req.user.anime_virtuals)

    } catch (e) {
        res.status(400).send()
    }
})

// Delete an anime
router.delete('/animes/delete/:id', auth,async (req, res) => {
    try {
        const delCount = await Anime.deleteOne({_id:req.params.id,owner:req.user._id})
        if(delCount.deletedCount===0){
            return res.status(400).send()
        }
        res.status(200).send()
    } catch (e) {
        res.status(500).send()
    }
})

// Delete all Task
router.delete('/animes/deleteAll', auth, async (req, res) => {
    try {
        await Anime.deleteMany({owner:req.user._id})
        res.status(200).send()

    } catch (e) {
        res.status(400).send()
    }
})

module.exports = router