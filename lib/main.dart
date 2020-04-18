import 'package:flutter/material.dart';
import 'package:gotta_go_fast/routes.dart' as r;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gotta Go Fast',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: r.routes,
    );
  }
}
