const characterSearchResolver = require('./character/searchCharacter_resolver')
const characterDetailResolver = require('./character/characterDetail_resolver')
const animeSearchResolver = require("./anime/search_anime_resolver")

const RootResolver = {
    ...characterSearchResolver,
    ...characterDetailResolver,
    ...animeSearchResolver
    
}

module.exports = RootResolver;