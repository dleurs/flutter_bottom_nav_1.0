import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';

abstract class BaseScreenState<T extends StatefulWidget> extends State<T> {
  @protected
  Brightness get mode => Brightness.dark;

  bool _isProcessing = false;

  bool get isGestureEnabled => !_isProcessing;

  bool get isProcessing => _isProcessing;

  String get currentRoute => null;

  String get name;

  StreamSubscription _sub;

  @override
  void initState() {
    super.initState();
    //Analytics.instance.setCurrentScreen(this.name, this.widget.toStringShort());
    _initSubscriptionForUniLinks();
    _initNumberlySdk();
    print("ScreenLifecycle: ${this.widget.toStringShort()}: initState");
  }

  Future<void> _initNumberlySdk() async {
    try {
      //String token = await NumberlySdkFlutter.token;
      //print("Push token: $token");
    } catch (e) {
      print("Error configuring Numberly SDK, error: " + e.toString());
    }
  }

  Future<bool> initUniLinks() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      Uri initialUri = await getInitialUri();
      return _processReceivedUri(initialUri);
    } on PlatformException {
      print("Failed to get initial uri.");
    } on FormatException {
      print("Bad parse the initial link as Uri.");
    }
    return false;
  }

  ///
  /// An implementation using the [Uri] convenience helpers
  /// FIXME: what to do on errors ??
  ///
  void _initSubscriptionForUniLinks() async {
    // Attach a listener to the Uri links stream
    _sub = getUriLinksStream().listen((Uri uri) {
      _processReceivedUri(uri);
    }, onError: (e, stack) {
      print("Error updating uri, error: " + e.toString());
    });
  }

  bool _processReceivedUri(Uri uri) {
    if (mounted && uri != null) {
      print('Initial URI: $uri,'
          ' path: ${uri.path},'
          ' query: ${uri.query}'
          ' query parameters: ${uri.queryParameters},'
          ' query parameters all: ${uri.queryParametersAll}');

/*       var config = AppRoutes.getConfig(uri.path);
      if (config != null) {
        Navigator.pushNamedAndRemoveUntil(context, uri.path, (route) => false,
            arguments: uri.queryParameters);
        return true;
      } */
      //FIXME open home if there is no path or if it's not recognized

    }
    return false;
  }

  @override
  void dispose() {
    if (_sub != null) _sub.cancel();
    print("ScreenLifecycle: ${this.widget.toStringShort()}: dispose");
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    print("ScreenLifecycle: ${this.widget.toStringShort()}: reassemble");
  }

  @override
  void deactivate() {
    print("ScreenLifecycle: ${this.widget.toStringShort()}: deactivate");
    super.deactivate();
  }

  @override
  void didUpdateWidget(T oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("ScreenLifecycle: ${this.widget.toStringShort()}: didUpdateWidget");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print(
        "ScreenLifecycle: ${this.widget.toStringShort()}: didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    print(
        "ScreenLifecycle: ${this.widget.toStringShort()}: build, mode is ${this.mode}");

    return AbsorbPointer(
      absorbing: _isProcessing,
      child: SafeArea(
        child: Scaffold(
/*           backgroundColor:
              mode == Brightness.dark ? AppColors.primary : Colors.white, */
          appBar: this.buildAppBar(context),
          body:
              /* Theme(
            data: mode == Brightness.dark
                ? AppTheme.darkTheme
                : AppTheme.lightTheme,
            isMaterialAppTheme: true,
            child: BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                if (state is AuthenticationProcessing) {
                  startProcessing();
                } else {
                  stopProcessing();
                }

                if (state is LoggedOut) {
                  this.onLoggedOut();
                } else if (state is AuthenticationSuccess) {
                  this.onLoggedIn();
                } else if (state is AuthenticationError) {
                  this.onLoginError(state.error);
                } else {
                  this.onStateChanged(context, state);
                }
              },
              child:  */
              Builder(builder: (context) => this.buildScreen(context)),
          //),
          //),
          bottomNavigationBar: this.buildBottomNavigationBar(context),
          floatingActionButton: this.buildFloatingActionButton(context),
        ),
      ),
    );
  }

  Widget buildScreen(BuildContext context);

  ///
  /// Implement this to build an [AppBar] for all screens
  /// Override this method in each screen that needs a specific one
  ///
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return null;
  }

  ///
  /// Implement this to build a [BottomNavigationBar] for all screens
  /// Override this method in each screen that needs a specific one
  ///
  Widget buildBottomNavigationBar(BuildContext context) {
/*     if (currentRoute != null) {
      return BottomNavBar(
        selectedRoute: currentRoute,
        onSelectRoute: _onItemTapped,
      );
    } */
    return null;
  }

  ///
  /// Implement this to build a [FloatingActionButton] for all screens
  /// Override this method in each screen that needs a specific one
  ///
  Widget buildFloatingActionButton(BuildContext context) {
    return null;
  }

  ///
  /// Default back navigation behavior
  ///
  void goBack() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  ///
  /// Sends a log in event
  ///
/*   void doLogin(String login, String password) {
    BlocProvider.of<AuthenticationBloc>(context)
        .add(LoginEvent(login, password));
  } */

  ///
  /// Sends a logout event
  ///
/*   void doLogout() {
    BlocProvider.of<AuthenticationBloc>(context).add(LogoutEvent());
  } */

  ///
  /// Logout event has completed
  /// Clear all navigation history and push login page
  /// Override this method to implement how the app should behave
  /// once a user has been logged out
  ///
/*   void onLoggedOut() {
    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (r) => false);
  } */

  ///
  /// Log in event has completed
  /// Override this method to implement how the app should behave
  /// once a user has been logged in
  ///
/*   void onLoggedIn() {
    UserManager.load();
  } */

  ///
  /// Log in event responded with an error
  /// Override this method to implement how the app should behave
  ///
  void onLoginError(String error) {}

  ///
  /// Unprocessed authentication state fired
  ///
  // void onStateChanged(BuildContext context, AuthenticationState state) {}

  void startProcessing() {
    setState(() {
      _isProcessing = true;
    });
  }

  void stopProcessing() {
    setState(() {
      _isProcessing = false;
    });
  }

/*   void _onItemTapped(String route) {
    if (route == AppRoutes.scan) {
      // Do not remove previous navigation stack if going to scan screen
      Navigator.pushNamed(context, route);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
    }
  } */

  @protected
  AppBar buildDefaultAppBar(
      {String title,
      Brightness mode = Brightness.dark,
      bool hasBackButton = true,
      bool hasLogo = true,
      List<Widget> actions = const [],
      Color background}) {
    bool drawBackButton = hasBackButton && Navigator.canPop(context);

    return AppBar(
      leading: drawBackButton
          ? IconButton(
              icon: Icon(
                Icons.arrow_back,
                //color: textColor,
              ),
              onPressed: this.goBack)
          : Container(),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          title != null
              ? Text(
                  title,
                )
              : SizedBox(height: 0)
        ],
      ),
      centerTitle: true,
      elevation: 0.0,
      actions: <Widget>[
        ...actions,
        drawBackButton && actions.isEmpty ? SizedBox(width: 50) : Container()
      ],
    );
  }

  void closeSoftKeyboard() {
    FocusScope.of(context).unfocus();
  }
}
