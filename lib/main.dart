import 'package:drowsiness_detection/screens/Dashboard.dart';
import 'package:drowsiness_detection/screens/Login.dart';
import 'package:drowsiness_detection/screens/Profile.dart';
import 'package:flutter/material.dart';
import 'helper/SharedPreferencesHelper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future<bool> getLoggedInStatus =
      SharedPreferencesHelper().getLoggedInStatus();
  runApp(
    MyApp(
      loginChecker: getLoggedInStatus,
    ),
  );
}

class MyApp extends StatefulWidget {
  final Future<bool> loginChecker;
  const MyApp({Key key, this.loginChecker}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.loginChecker,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return MaterialApp(
            title: 'Driberry.AI',
            theme: ThemeData(
              primaryColor: Color(0xFF184EAA),
            ),
            home: (snapshot.requireData) ? Layout() : Login(),
          );
        });
  }
}

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      Dashboard(),
      Profile(),
    ];
    final _kBottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Image.asset(
          "asset/clock.png",
          width: 30,
          height: 30,
        ),
        label: 'Dashboard',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          "asset/user.png",
          width: 30,
          height: 30,
        ),
        label: 'Profile',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Drowsiness Detection"),
      ),
      body: _kTabPages[_currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: _kBottomNavBarItems,
        currentIndex: _currentTabIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
      ),
    );
  }
}
