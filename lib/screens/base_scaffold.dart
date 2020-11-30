import 'package:bottom_nav_v1/models/bottom_nav_provider.dart';
import 'package:bottom_nav_v1/screens/nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseScaffold extends StatefulWidget {
  final String path;
  final Widget body;

  BaseScaffold({@required this.path, @required this.body});

  @override
  _BaseScaffoldState createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BottomNavProvider>(
      create: (BuildContext context) => BottomNavProvider(),
      child:
          Consumer<BottomNavProvider>(builder: (context, bottomNavProvider, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text("BottomNav App"),
          ),
          body: widget.body,
          bottomNavigationBar: (widget.path == NavBarScreen.path)
              ? NavBarScreen.buildBottonNavBar(context: context)
              : null,
        );
      }),
    );
  }
}
