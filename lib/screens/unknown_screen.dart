import 'package:flutter/material.dart';

class UnknownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          Text("Unknown Screen", style: Theme.of(context).textTheme.headline5),
    );
  }
}
