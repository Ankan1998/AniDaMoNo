const { buildSchema, print } = require('graphql');
const { mergeTypeDefs } = require('@graphql-tools/merge')
const characterSearch = require('./character/searchCharacter_schema');
const characterDetail = require('./character/character_Detail_schema.js')

const rootTypes = `
type RootQuery {
    characters: [Character]
    characterById: CharacterDetail
}

schema {
    query: RootQuery
}
`;

const types = [characterSearch, characterDetail,rootTypes];
const typeDefs = mergeTypeDefs(types)
const schemaMerged = buildSchema(print(typeDefs));

module.exports = schemaMerged