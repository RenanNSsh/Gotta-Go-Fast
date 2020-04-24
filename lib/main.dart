import 'package:flutter/material.dart';
import 'package:gotta_go_fast/themes/app_themes.dart';
import 'package:gotta_go_fast/themes/theme_type.dart';
import 'package:provider/provider.dart';
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
    return ChangeNotifierProvider<AppThemes>(
      builder: (_) => AppThemes(type: ThemeType.DEFAULT),
      child:  MaterialAppWithTheme(),
    );
   
  }

}

class MaterialAppWithTheme extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppThemes>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gotta Go Fast',
      theme: theme.getTheme(),
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
