import 'package:bottom_nav_v1/screens/nav_bar_scaffold.dart';
import 'package:flutter/material.dart';

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
    print("[Build] BaseScaffoldScreen " + widget.path);
    return (widget.path != NavBarScaffold.path)
        ? Scaffold(
            appBar: AppBar(
              title: Text("BottomNav App"),
            ),
            body: widget.body,
          )
        : NavBarScaffold();
  }
}
