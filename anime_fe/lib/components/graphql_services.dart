import 'package:anime_fe/components/graphql_queries.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'graphql_client.dart';

class GraphqlService{
  Future<dynamic> searchAnime(
      String anime_name) async {
    QueryResult result = await getGraphqlClient(header: Map()).then(
          (value) => value.value.query(
        QueryOptions(
          fetchPolicy: FetchPolicy.networkOnly,
          document: gql(GraphqlQuery.getAnimes(anime_name)),
        ),
      ),
    );
    print(result.data["animes"]);
    return 0;
  }
}