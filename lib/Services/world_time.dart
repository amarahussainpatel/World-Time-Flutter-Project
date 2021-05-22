import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String time;
  String flag;
  String url;
  bool isDayTime;

  WorldTime({this.location , this.flag , this.url});

  Future<void> getData () async {
    Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
    //print(response.body);
    Map data = jsonDecode(response.body);
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);  //substring bcz +05:00 we need to extract just 05 so that it can be added to our datetime
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    isDayTime = now.hour > 6 && now.hour < 20 ? true : false ;

    time = DateFormat.jm().format(now);
  }
}

