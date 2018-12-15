import 'package:flutter/material.dart';
import './screens/home.dart';

void main() => runApp(new HelloFlutterApp());


class HelloFlutterApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App Flutter",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Scaffold - App Bar"),
        ),
        body: home()
      ),
    );
  }
}
