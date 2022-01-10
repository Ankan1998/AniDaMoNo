const characterResolver = require('./character/searchCharacter_resolver')
const characterDetail = require('./character/characterDetail_resolver')

const RootResolver = {
    ...characterResolver,
    ...characterDetail
    
}

module.exports = RootResolver;