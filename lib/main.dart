import 'package:flutter/material.dart';
import 'package:gotta_go_fast/screens/cpu_add.dart';
import 'package:gotta_go_fast/screens/cpu_detail.dart';
import 'package:gotta_go_fast/screens/cpu_list.dart';
import 'package:gotta_go_fast/screens/favourites.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gotta Go Fast',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
      ),
      onGenerateRoute: (RouteSettings settings){
        var routes = <String, WidgetBuilder>{
          '/': (BuildContext context) => CPUList(settings.arguments),
          '/cpu_detail': (BuildContext context) => CPUDetailScreen(settings.arguments),
          '/cpu_add': (BuildContext context) => CPUAddScreen(),
          '/favourites': (BuildContext context) => Favourites()
        };
        WidgetBuilder builder = routes[settings.name];
        return MaterialPageRoute(builder: (ctx) => builder(ctx));
      },
      initialRoute: '/'
    );
  }
}
