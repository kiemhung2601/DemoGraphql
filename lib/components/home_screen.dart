import 'package:demographql/components/article_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:demographql/main.dart';


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
          document: gql(products),
          pollInterval: const Duration(seconds: 120),
        ),
        builder: (QueryResult result, {fetchMore, refetch}) {             
          if(result.hasException){                   
            return Text(result.exception.toString());
          }
         
          if(result.isLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final productList = result.data?['products']['edges'];
          //print(productList);
          return 
          ListView.builder(
            itemCount: productList.length,
            itemBuilder: (_, index){
              var product = productList[index]['node'];
              return Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                  ),
                  child: Article(title: product['name'], image: 'https://media.istockphoto.com/photos/hot-air-balloons-flying-over-the-botan-canyon-in-turkey-picture-id1297349747', description: product['description'], subtitle: 'https://www.mcsweeneys.net/')
              );
            },
          );
        },
      ),
    );
  }
}
