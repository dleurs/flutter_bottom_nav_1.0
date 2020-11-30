import 'package:bottom_nav_v1/models/bottom_nav_provider.dart';
import 'package:bottom_nav_v1/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavBarScreen extends StatelessWidget {
  static const String path = "/home";

  static Widget buildBottonNavBar({@required BuildContext context}) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home 1',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Home 2',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Home 3',
        ),
      ],
      currentIndex: Provider.of<BottomNavProvider>(context).currentIndex,
      onTap: Provider.of<BottomNavProvider>(context).setIndex,
    );
  }

  static const List<Widget> _navBarChildren = <Widget>[
    NavBarChildScreen(
      index: 0,
    ),
    NavBarChildScreen(
      index: 1,
    ),
    NavBarChildScreen(
      index: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return _navBarChildren
        .elementAt(Provider.of<BottomNavProvider>(context).currentIndex);
  }
}

class NavBarChildScreen extends StatelessWidget {
  final int index;
  const NavBarChildScreen({@required this.index});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Nav Bar Child " + index.toString() + " Screen",
            style: Theme.of(context).textTheme.headline5),
        SizedBox(height: 50),
        RaisedButton(
          child: Text("Detail Screen",
              style: Theme.of(context).textTheme.headline6),
          onPressed: () {
            Navigator.pushNamed(context, DetailScreen.path);
          },
        )
      ],
    ));
  }
}
