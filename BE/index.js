const express = require('express')
const UserRouter = require('./router/rest/user')
const {graphqlHTTP} = require('express-graphql')
const graphQlResolvers = require('./router/graphql/resolvers/main_resolver')
const graphQlSchema = require('./router/graphql/schemas/merged_schemas');

const app = express()
const port = process.env.PORT || 3000

app.use(express.json())

app.use(UserRouter)

app.use(
    '/graphql',
    graphqlHTTP({
      schema: graphQlSchema,
      rootValue: graphQlResolvers,
      graphiql: true
    })
  );

app.listen(port,()=>{
    console.log('Server listening at Port: ' + port)
})