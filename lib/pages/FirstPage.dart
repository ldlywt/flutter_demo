import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget{
  @override
  FirstPageState createState()  => new FirstPageState();

}

class FirstPageState extends State<FirstPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("First"),
      ),
      body: new Center(
        child: new Text("我是第一页"),
      ),
    );
  }
}