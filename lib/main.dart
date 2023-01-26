import 'package:flutter/material.dart';
import 'package:wordtime_flutter/pages/choose_location.dart';
import 'package:wordtime_flutter/pages/home.dart';
import 'package:wordtime_flutter/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation()
    },
  ));
}
