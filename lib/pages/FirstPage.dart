import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  FirstPageState createState() => new FirstPageState();
}

class FirstPageState extends State<FirstPage> {
  String _content = "xxxxxxxxx";
  var url_1 = "http://www.weather.com.cn/data/sk/101110101.html"; //西安
  var url_2 = "http://www.weather.com.cn/data/sk/101010100.html"; //北京
  var url_3 = "http://www.weather.com.cn/data/sk/101280601.html"; //深圳

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("网络请求学习"),
      ),
      body: new Center(
          child: Column(
            children: <Widget>[
              new RaisedButton(
                onPressed: getNet_1,
                color: Colors.redAccent,
                child: new Text("原生方式"),
              ),
              RaisedButton(
                color: Colors.lightBlue,
                onPressed: getNet_2,
                child: new Text("http方式"),
              ),
              RaisedButton(
                onPressed: getNet_3,
                color: Colors.green,
                child: new Text("dio方式"),
              ),
              new Padding(
                  padding: EdgeInsets.all(20.0), child: new Text(_content))
            ],
          )),
    );
  }

  void getNet_1() async {
    debugPrint("原生的网络请求方式");
    var result;
    var client = new HttpClient();
    var request = await client.getUrl(Uri.parse(url_1));
    var response = await request.close();
    if (response.statusCode == HttpStatus.ok) {
      result = await response.transform(Utf8Decoder()).join();
    }
    setState(() {
      _content = result;
    });
  }

  void getNet_2() {
    debugPrint("  我点击了  Padding  下的  RaisedButton");
  }

  void getNet_3() {
    debugPrint("  我点击了  Padding  下的  RaisedButton");
  }
}
