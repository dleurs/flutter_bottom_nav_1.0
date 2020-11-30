import 'package:bottom_nav_v1/screens/detail_screen.dart';
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
    print("[Build] NavBarScreen");
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

class NavBarChildScreen extends StatefulWidget {
  final int index;
  const NavBarChildScreen({@required this.index});

  @override
  _NavBarChildScreenState createState() => _NavBarChildScreenState();
}

class _NavBarChildScreenState extends State<NavBarChildScreen>
    with AutomaticKeepAliveClientMixin<NavBarChildScreen> {
  @override
  Widget build(BuildContext context) {
    print("[Build] NavBarChildScreen " + widget.index.toString());
    super.build(context);
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Nav Bar Child " + widget.index.toString() + " Screen",
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

  @override
  bool get wantKeepAlive => true;
}
