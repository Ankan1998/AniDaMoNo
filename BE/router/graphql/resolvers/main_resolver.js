const characterSearchResolver = require('./character/searchCharacter_resolver')
const characterDetailResolver = require('./character/characterDetail_resolver')
const animeSearchResolver = require("./anime/search_anime_resolver")
const animeDetailResolver = require('./anime/anime_detail_resolver')

const RootResolver = {
    ...characterSearchResolver,
    ...characterDetailResolver,
    ...animeSearchResolver,
    ...animeDetailResolver
    
}

module.exports = RootResolver;