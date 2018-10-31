import 'package:flutter/material.dart';
import 'package:flutter_navigationbar/pages/FirstPage.dart';
import 'package:flutter_navigationbar/pages/SecondPage.dart';
import 'package:flutter_navigationbar/pages/ThirdPage.dart';


class AppTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(home: Home());
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    FirstPage(),
    SecondPage(),
    ThirdPage()
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: AppBar(
//        title: Text("第二种方式"),
//        centerTitle: true,
//      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
              title: new Text("Home"), icon: new Icon(Icons.home)),
          BottomNavigationBarItem(
              title: new Text("List"), icon: new Icon(Icons.list)),
          BottomNavigationBarItem(
              title: new Text("Message"), icon: new Icon(Icons.message)),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
