const { buildSchema, print } = require('graphql');
const { mergeTypeDefs } = require('@graphql-tools/merge')
const characterSearch = require('./character/searchCharacter_schema');
const characterDetail = require('./character/character_Detail_schema.js')
const animeSearch = require('./anime/search_anime_schema')

const rootTypes = `
type RootQuery {
    characters(name:String!): [Character]
    characterById(id:Int!): CharacterDetail
    animes(name:String!):[Animes]
}

schema {
    query: RootQuery
}
`;

const types = [characterSearch, characterDetail,animeSearch,rootTypes];
const typeDefs = mergeTypeDefs(types)
const schemaMerged = buildSchema(print(typeDefs));

module.exports = schemaMerged