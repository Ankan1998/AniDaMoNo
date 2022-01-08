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

module.exports = mergeTypeDefs(types)