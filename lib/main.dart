import 'package:bottom_nav_v1/screens/base_scaffold.dart';
import 'package:bottom_nav_v1/screens/detail_screen.dart';
import 'package:bottom_nav_v1/screens/first_screen.dart';
import 'package:bottom_nav_v1/screens/nav_bar_screen.dart';
import 'package:bottom_nav_v1/screens/unknown_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          switch (settings.name) {
            case FirstScreen.path: // "/"
              return BaseScaffold(path: FirstScreen.path, body: FirstScreen());
            case NavBarScreen.path: // "/home"
              return BaseScaffold(
                  path: NavBarScreen.path, body: NavBarScreen());
            case DetailScreen.path: // "/home/detail"
              return BaseScaffold(
                  path: DetailScreen.path, body: DetailScreen());
            default:
              return BaseScaffold(path: null, body: UnknownScreen());
          }
        });
      },
    );
  }
}
