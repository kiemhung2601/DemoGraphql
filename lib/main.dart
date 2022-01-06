import 'package:demographql/components/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:demographql/api.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Demo Graphql',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}