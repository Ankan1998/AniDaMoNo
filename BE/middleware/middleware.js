const jwt = require("jsonwebtoken")
const User = require("../model/user_model")

const auth = async function(req,res,next){
    try {
        const token = (req.headers.authorization).split(' ')[1]
        const decoded_token = jwt.verify(token,'ankan12345')
        const user = await User.findOne({_id:decoded_token._id,"tokens.token":token})
        if (!user){
            throw new Error()
        } 
        
        req.user = user
        req.token = token
        next()
        
    } catch(e){
        res.status(400).send("Please Authenticate")
    }
}

module.exports = auth