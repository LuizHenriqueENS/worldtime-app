import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String? location; // Location name for the UI
  String? time; // the time in the that location
  String? flag; // url to an assest flag icon
  String? url; // location url for api endpoint

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    Response response =
        await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);

    // get properties from data
    String datetime = data['datetime'];
    String utc_offset = data['utc_offset'].toString().substring(0, 3);

    // create a DateTime obj
    DateTime now = DateTime.parse(datetime);

    now = now.add(Duration(hours: int.parse(utc_offset)));

    // set the time property
    time = now.toString();
  }
}
