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
  var url_2 =
      "http://mobile.weather.com.cn/data/sk/101010100.html?_=1381891661455"; //北京
  var url_3 =
      "http://mobile.weather.com.cn/data/sk/101280601.html?=1381891661455"; //深圳
  var url_post =
      "http://www.wanandroid.com/user/login"; //username : hellonews，password :123456

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("网络请求学习"),
      ),
      body: new Center(
          child: Column(
            children: <Widget>[
              buildRow(getNet_1, "原生方式-GET", postNet_1, "原生方式-POST"),
              buildRow(getNet_2, "http方式-GET", postNet_2, "http方式-POST"),
              buildRow(getNet_2, "dio方式-GET", postNet_3, "dio方式-POST"),
              new Padding(
                  padding: EdgeInsets.all(20.0), child: new Text(_content))
            ],
          )),
    );
  }

  Row buildRow(VoidCallback method1, String text1, VoidCallback method2,
      String text2) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new RaisedButton(
          onPressed: method1,
          color: Colors.redAccent,
          child: new Text(text1),
        ),
        new RaisedButton(
          onPressed: method2,
          child: new Text(text2),
          color: Colors.blue,
        )
      ],
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

  //https://stackoverflow.com/questions/21491543/how-to-do-post-in-dart-command-line-httpclient
  void postNet_1() async {
    debugPrint("原生的网络请求方式--->post");
    _content = "找了很久，貌似只能用http或者dio，见\n"
        "https://stackoverflow.com/questions/21491543/how-to-do-post-in-dart-command-line-httpclient";
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

  /// If [body] is a Map, it's encoded as form fields using [encoding]. The
  /// content-type of the request will be set to
  /// `"application/x-www-form-urlencoded"`;
  void postNet_2() async {
    var params = Map<String, String>();
    params["username"] = "hellonews";
    params["password"] = "123456";

    var client = http.Client();
    var response = await client.post(url_post, body: params);
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

  void postNet_3() async {
//不能用这种方式
//    var params = Map<String, String>();
//    params["username"] = "hellonews";
//    params["password"] = "123456";
    FormData formData = new FormData.from({
      "username": "hellonews",
      "password": 123456,
    });

    var dio = new Dio();
    var response = await dio.post(url_post, data: formData);
    _content = response.data.toString();
    setState(() {});
  }
}
