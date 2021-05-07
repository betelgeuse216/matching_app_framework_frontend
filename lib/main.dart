import 'package:flutter/material.dart';
import 'package:matching_app_framework/ui/theme_data.dart';
import 'package:matching_app_framework/ui/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: getThemeData(),
      home: Home(title: 'Matching App Framework'),
      // home: ProfileDetails3Profile(),
    );
  }
}