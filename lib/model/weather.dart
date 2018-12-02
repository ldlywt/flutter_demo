class Weather {
  SkInfo skInfo;

  Weather({this.skInfo});

  Weather.fromJson(Map<String, dynamic> json) {
    skInfo =
        json['sk_info'] != null ? new SkInfo.fromJson(json['sk_info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.skInfo != null) {
      data['sk_info'] = this.skInfo.toJson();
    }
    return data;
  }
}

class SkInfo {
  String date;
  String cityName;
  String areaID;
  String temp;
  String tempF;
  String wd;
  String ws;
  String sd;
  String time;
  String sm;

  SkInfo(
      {this.date,
      this.cityName,
      this.areaID,
      this.temp,
      this.tempF,
      this.wd,
      this.ws,
      this.sd,
      this.time,
      this.sm});

  SkInfo.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    cityName = json['cityName'];
    areaID = json['areaID'];
    temp = json['temp'];
    tempF = json['tempF'];
    wd = json['wd'];
    ws = json['ws'];
    sd = json['sd'];
    time = json['time'];
    sm = json['sm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['cityName'] = this.cityName;
    data['areaID'] = this.areaID;
    data['temp'] = this.temp;
    data['tempF'] = this.tempF;
    data['wd'] = this.wd;
    data['ws'] = this.ws;
    data['sd'] = this.sd;
    data['time'] = this.time;
    data['sm'] = this.sm;
    return data;
  }
}
