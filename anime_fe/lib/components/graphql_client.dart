import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

Future<ValueNotifier<GraphQLClient>> getGraphqlClient(
    {Map<String, String> header}) async {

  ValueNotifier<GraphQLClient> graphqlClient = ValueNotifier(
    GraphQLClient(
      cache: GraphQLCache(),
      link: _getGraphqlLink(header),
    ),
  );
  return graphqlClient;
}

Link _getGraphqlLink(Map<String, String> header) {
  if (header == null) {
    header = Map();
  }
  String baseUrl = "http://192.168.8.116:3000/graphql";
  HttpLink link = HttpLink(baseUrl, defaultHeaders: header);
  return link;
}