import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FirstPage extends StatefulWidget {
  @override
  FirstPageState createState() => new FirstPageState();
}

class FirstPageState extends State<FirstPage> {
  String _content = "我是网络请求内容";
  var url_1 = "http://www.weather.com.cn/data/sk/101110101.html"; //西安
  var url_2 = "http://mobile.weather.com.cn/data/sk/101010100.html?_=1381891661455"; //北京
  var url_3 = "http://mobile.weather.com.cn/data/sk/101280601.html?=1381891661455"; //深圳

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
    debugPrint("原生的网络请求方式--->get");
    var client = new HttpClient();
    var request = await client.getUrl(Uri.parse(url_1));
    var response = await request.close();
    if (response.statusCode == HttpStatus.ok) {
      _content = await response.transform(Utf8Decoder()).join();
    }
    setState(() {});
  }

  //现在好像不用导入依赖了
  void getNet_2() async {
    debugPrint("使用http网络请求--->get");
    var client = http.Client();
    http.Response response = await client.get(url_2);
    _content = response.body;
    setState(() {});
  }

  //https://github.com/flutterchina/dio/blob/flutter/README-ZH.md
  void getNet_3() async {
    debugPrint("使用第三方库Dio的请求--->get");
    Dio dio = new Dio();
    var response = await dio.get(url_3);
    _content = response.data.toString();
    setState(() {});
  }
}
