import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  static const String path = "/home/detail";

  @override
  Widget build(BuildContext context) {
    print("[Build] DetailScreen");
    return Center(
      child:
          Text("Detail Screen", style: Theme.of(context).textTheme.headline5),
    );
  }
}
