import 'package:bottom_nav_v1/screens/nav_bar_child_screen.dart';
import 'package:flutter/material.dart';

class NavBarScaffold extends StatefulWidget {
  static const String path = "/home";

  NavBarScaffold({Key key}) : super(key: key);

  @override
  _NavBarScaffoldState createState() => _NavBarScaffoldState();
}

class _NavBarScaffoldState extends State<NavBarScaffold> {
  int _currentIndex;
  List<Widget> _pages;
  PageController _pageController;

  @override
  void initState() {
    super.initState();

    _currentIndex = 0;

    _pages = <Widget>[
      NavBarChildScreen(
        index: 0,
      ),
      NavBarChildScreen(
        index: 1,
      ),
      NavBarChildScreen(
        index: 2,
      )
    ];

    _pageController = PageController(initialPage: _currentIndex);
  }

  Widget buildBottonNavBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'NavBar 0',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'NavBar 1',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'NavBar 2',
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (selectedPageIndex) {
        setState(() {
          _currentIndex = selectedPageIndex;
          _pageController.jumpToPage(selectedPageIndex);
        });
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("[Build] NavBarScaffold " + NavBarScaffold.path);
    return Scaffold(
      appBar: AppBar(
        title: Text("BottomNav App"),
      ),
      body: PageView(
        controller: _pageController,
        //The following parameter is just to prevent
        //the user from swiping to the next page.
        physics: NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: buildBottonNavBar(),
    );
  }
}
