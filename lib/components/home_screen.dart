import 'package:demographql/components/article_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:demographql/api.dart';
import 'package:demographql/article.dart';

List<Articles> listarticle = [
  Articles('title nè hehehehehhehe', 'https://media.istockphoto.com/photos/hot-air-balloons-flying-over-the-botan-canyon-in-turkey-picture-id1297349747', 'description nè hahahahahahaha', 'https://www.facebook.com/kiem.hungs/'),
  Articles('title 2 nè hehehehehhehe', 'https://media.istockphoto.com/photos/hot-air-balloons-flying-over-the-botan-canyon-in-turkey-picture-id1297349747', 'description nè hahahahahahaha', 'https://www.facebook.com/kiem.hungs/'),
  Articles('title 3 nè hehehehehhehe', 'https://media.istockphoto.com/photos/hot-air-balloons-flying-over-the-botan-canyon-in-turkey-picture-id1297349747', 'description nè hahahahahahaha', 'https://www.facebook.com/kiem.hungs/'),
  Articles('title 4 nè hehehehehhehe', 'https://media.istockphoto.com/photos/hot-air-balloons-flying-over-the-botan-canyon-in-turkey-picture-id1297349747', 'description nè hahahahahahaha', 'https://www.facebook.com/kiem.hungs/'),
  Articles('title 5 nè hehehehehhehe', 'https://media.istockphoto.com/photos/hot-air-balloons-flying-over-the-botan-canyon-in-turkey-picture-id1297349747', 'description nè hahahahahahaha', 'https://www.facebook.com/kiem.hungs/'),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(     
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Hello Graphql Demo',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.red, Colors.blue]),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
            ),
          ),
        ),
      ),
      body: Query(
        options: QueryOptions(
          document: gql(articlesGraphQL),
        ),
        builder: (QueryResult result, {fetchMore, refetch}) {             
          if(result.hasException){
            print(result.hasException);           
            return Text(result.exception.toString());
          }
          if(result.isLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List articleList = result.data?['articles'];
          
          print(articleList);
          return ListView(
            children: listarticle.map((at) {
              return Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: const BorderRadius.all(Radius.circular(25))
                ),
                child: Article(title: at.titlel, image: at.image.toString(), description: at.description.toString(), subtitle: at.subtitle.toString())
                );
            }).toList(),
          );
        },
      ),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(     
//         preferredSize: const Size.fromHeight(50),
//         child: AppBar(
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//           title: const Text(
//             'Hello Graphql Demo',
//             style: TextStyle(
//               fontSize: 25,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           centerTitle: true,
//           flexibleSpace: Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(colors: [Colors.red, Colors.blue]),
//               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
//             ),
//           ),
//         ),
//       ),
//       body: Query(
//         options: QueryOptions(
//           document: gql(articlesGraphQL),
//         ),
//         builder: (QueryResult result, {fetchMore, refetch}) {             
//           if(result.hasException){
//             print(result.hasException);           
//             return Text(result.exception.toString());
//           }
//           // if (result.hasException) {
//           //   if (result.exception!.linkException is ServerException) {
//           //     ServerException exception =
//           //         result.exception!.linkException as ServerException;
//           //     var errorMessage = exception.parsedResponse!.errors![0].message;
//           //     print(errorMessage);
//           //     throw Exception(errorMessage);
//           //   }
//           // } 
//           if(result.isLoading){
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           List articleList = result.data?['articles'];
          
//           print(articleList);
//           return ListView(
//             children: listarticle.map((at) {
//               return Container(
//                 padding: const EdgeInsets.all(5),
//                 margin: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: Colors.blue[100],
//                   borderRadius: const BorderRadius.all(Radius.circular(25))
//                 ),
//                 child: Article(title: at.titlel, image: at.image.toString(), description: at.description.toString(), subtitle: at.subtitle.toString())
//                 );
//             }).toList(),
//           );
//         },
//       ),
//     );
//   }
// }