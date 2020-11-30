import 'package:bottom_nav_v1/screens/nav_bar_screen.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  static const String path = "/";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("First Screen", style: Theme.of(context).textTheme.headline5),
          SizedBox(height: 50),
          RaisedButton(
            child: Text("Home Screen",
                style: Theme.of(context).textTheme.headline6),
            onPressed: () {
              Navigator.pushNamed(context, NavBarScreen.path);
            },
          )
        ],
      ),
    );
  }
}
