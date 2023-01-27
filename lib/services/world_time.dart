import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String? location; // Location name for the UI
  String? time; // the time in the that location
  String? flag; // url to an assest flag icon
  String? url; // location url for api endpoint
  bool? isDayTime;
  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      // get properties from data
      String datetime = data['datetime'];
      String utcOffset = data['utc_offset'].toString().substring(0, 3);

      // create a DateTime obj
      DateTime now = DateTime.parse(datetime);

      now = now.add(Duration(hours: int.parse(utcOffset)));
      isDayTime = now.hour > 6 && now.hour < 19 ? true : false;

      // set the time property
      time = DateFormat.Hm().format(now);
    } catch (e) {
      print('error caught $e');
      time = 'could not get time data';
    }
  }
}
