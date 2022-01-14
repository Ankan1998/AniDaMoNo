const mongoose = require('mongoose')
const validator = require('validator')
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')

const UserSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim: true
    },
    email: {
        type: String,
        unique: true,
        validate(val) {
            if (!validator.isEmail(val)) {
                throw new Error('Email invalid')
            }
        }
    },
    password: {
        type: String
    },
    dp:{
        type: String
    },
    tokens: [{
        token: {
            type: String,
            required: true,
        }
    }]

}, {
    timestamps: true
})

// Hiding password and token
UserSchema.methods.toJSON = function () {
    const Obj = this.toObject()
    delete Obj.password
    delete Obj.tokens
    return Obj
}

//Json web token instance method
UserSchema.methods.generateToken = async function (id) {
    const token = jwt.sign({
        _id: id.toString()
    }, "ankan12345")
    this.tokens.push({
        token: token
    })
    await this.save()
    return token
}

// Match credential static method(class method)
UserSchema.statics.matchCred = async function (emailID, password) {
    const user = await users.findOne({
        email: emailID
    })
    if (!user) {
        throw new Error("Login Error")
    }
    const isSame = await bcrypt.compare(password, user.password)
    if (!isSame) {
        throw new Error("Login Error")
    }
    return user

}

UserSchema.virtual('anime_virtuals',{
    ref: 'Anime',
    localField: '_id',
    foreignField: 'owner'
})

UserSchema.pre('save', async function (next) {
    if (this.isModified('password')) {
        this.password = await bcrypt.hash(this.password, 8)
    }
    next()
})


const users = mongoose.model('User', UserSchema)

module.exports = users