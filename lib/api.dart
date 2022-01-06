import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final String token = "your can get it from a secured storage";

final HttpLink httpLink = HttpLink('https://iwa-test.herokuapp.com/');

final AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer $token',
  );
  
final Link link = authLink.concat(httpLink);

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    link: link,
    cache: GraphQLCache(store: InMemoryStore()),
  ),
);



String articlesGraphQL = """
query{
  articles {
    content,
    coverImageUrl,
    description,
    subtitle
  }
}
""";

