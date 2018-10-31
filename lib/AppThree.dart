import 'package:flutter/material.dart';
import 'package:flutter_navigationbar/pages/FirstPage.dart';
import 'package:flutter_navigationbar/pages/SecondPage.dart';
import 'package:flutter_navigationbar/pages/ThirdPage.dart';

class AppThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(home: Home());
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;
  List<Widget> list = new List();

  @override
  void initState() {
    super.initState();
    list..add(FirstPage())..add(SecondPage())..add(ThirdPage());
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return ThirdPage();
            }));
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: list[_index],
        bottomNavigationBar: BottomAppBar(
          color: Colors.lightBlue,
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.near_me),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    _index = 0;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.edit_location),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    _index = 1;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
