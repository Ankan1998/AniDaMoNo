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

module.exports = router