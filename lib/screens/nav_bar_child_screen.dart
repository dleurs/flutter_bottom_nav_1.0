import 'package:bottom_nav_v1/screens/detail_screen.dart';
import 'package:flutter/material.dart';

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
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Center(
          child: Text("Nav Bar Child " + widget.index.toString() + " Screen",
              style: Theme.of(context).textTheme.headline5),
        ),
        SizedBox(height: 30),
        Align(
          child: RaisedButton(
            child: Text("Detail Screen",
                style: Theme.of(context).textTheme.headline6),
            onPressed: () {
              Navigator.pushNamed(context, DetailScreen.path);
            },
          ),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 3.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 2.0, vertical: 2.0),
                    child: ListTile(
                      title: Text("Lorem ipsum"),
                      subtitle: Text(index.toString()),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
