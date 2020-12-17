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
    print("[Build] BaseScaffold" + widget.path);
    return Scaffold(
      appBar: AppBar(
        title: Text("BottomNav App"),
      ),
      body: widget.body,
    );
  }
}
