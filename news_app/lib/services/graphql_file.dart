import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlClass {
  static HttpLink httpLink = HttpLink(
      "https://primary-salmon-95.hasura.app/v1/graphql",
      defaultHeaders: <String, String>{
        'x-hasura-admin-secret':
            'z26PAq81dYiMEPI9aOrbANqRfCd0UCpkvRi5ObnnnwcIGdP4cl9Fb2YMojUN7O4E',
      });
  static Link link = httpLink;
  ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
    GraphQLClient(
      link: link,
      cache: GraphQLCache(store: HiveStore()),
    ),
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      link: link,
      cache: GraphQLCache(store: HiveStore()),
    );
  }
}
