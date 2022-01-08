const express = require('express')
require('../../mongoose')
const User = require('../../model/user_model')
const auth = require('../../middleware/middleware')

const router = new express.Router()

// User profile 
router.get('/users/me', auth, async (req, res) => {
    return res.send(req.user)
})

// new user signup
router.post('/users/signup', async (req, res) => {
    const user = new User(req.body)
    try {
        await user.save()
        const token = await user.generateToken(user._id)
        res.status(201).send({
            user,
            token
        })
    } catch (e) {
        res.status(400).send(e)
    }
})

//User login
router.post('/users/login', async (req, res) => {
    try {
        const user = await User.matchCred(req.body.email, req.body.password)
        const token = await user.generateToken(user._id)
        return res.status(200).send({
            user,
            token
        })
    } catch (e) {
        res.status(400).send()
    }
})

// User logout
router.get('/users/logout', auth, async (req, res) => {
    try {
        req.user.tokens = req.user.tokens.filter((token) => {
            return token.token != req.token
        })
        req.user.save()
        res.send("User logged out")
    } catch(e) {
        res.status(400).send()
    }

})

//User logout All
router.get('/users/logoutAll', auth, async (req, res) => {
    try {
        req.user.tokens = []
        req.user.save()
        res.send("User logged out from All places")
    } catch(e) {
        res.status(400).send()
    }

})

//Update user
router.patch('/users/update', auth, async (req, res) => {
    const changes = Object.keys(req.body) // Convert json fields to array 
    const allowedChanges = ['name', 'password']
    const isValidChange = changes.every((change) => {
        return allowedChanges.includes(change)
    })
    if (!isValidChange) {
        return res.status(400).send()
    }
    try {
        changes.forEach((change) => {
            req.user[change] = req.body[change]
        })

        await req.user.save()
        if (!req.user) {
            return res.status(404).send()
        }

        res.send(req.user)

    } catch (e) {
        res.status(400).send()
    }
})

// delete user
router.delete('/users/delete', auth, async (req, res) => {
    try {
        await req.user.remove()
        res.send(req.user)

    } catch(e) {
        res.status(400).send()
    }
})

//upload image url
router.post('/upload/url',auth, async (req,res)=>{
    try{
        
        req.user.dp = req.body.dp
        console.log(req.user.dp)
        req.user.save()
        res.send(req.user.dp)
    } catch(e){
        res.staus(400).send()
    }
    
})

//download image url
router.get('/download/url',auth, async (req,res)=>{
    try{
        const dp = req.user.dp
        if (!dp){
            return res.status(404).send()
        }
        res.send(req.user.dp)
    } catch(e){
        res.staus(400).send()
    }
    
})

module.exports = router;