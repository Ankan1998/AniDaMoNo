const { buildSchema, print } = require('graphql');
const { mergeTypeDefs } = require('@graphql-tools/merge')
const characterSearch = require('./searchCharacter_schema');

const rootTypes = `
type RootQuery {
    characters: [Character]
}

schema {
    query: RootQuery
}
`;

const types = [characterSearch, rootTypes];
const typeDefs = mergeTypeDefs(types)
const schemaMerged = buildSchema(print(typeDefs));

module.exports = schemaMerged