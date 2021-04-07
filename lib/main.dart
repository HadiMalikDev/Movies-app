import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies/screens/mainpage.dart';
import 'package:movies/screens/moviepage.dart';
import 'package:movies/screens/searchpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:MainPage(),
      // MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
