import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'dart:typed_data';
import 'dart:async';
import 'dart:ui' as ui;
import 'dart:convert';

import 'package:matching_app_framework/ui/appbar.dart';
import 'package:matching_app_framework/ui/appbar_bottom.dart';
import 'package:matching_app_framework/ui/swap_card.dart';

import 'package:flutter_tindercard/flutter_tindercard.dart';

// class Home extends StatefulWidget {
class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    getTextFromAPi();
  }

  void getTextFromAPi() {
    // Sample
    var url = Uri.https("reqres.in","api/users", {'page':'2'});
    // Test
    // - https://0gviiw91l1.execute-api.us-east-1.amazonaws.com/Prod/hello/
    // var url = Uri.https("0gviiw91l1.execute-api.us-east-1.amazonaws.com","Prod/hello/");
    // Profile
    // - https://0gviiw91l1.execute-api.us-east-1.amazonaws.com/Prod/profile/1
    // var url = Uri.https("0gviiw91l1.execute-api.us-east-1.amazonaws.com","Prod/profile/1");
    // Profile Image
    // - https://0gviiw91l1.execute-api.us-east-1.amazonaws.com/Prod/profile/1/images
    // var url = Uri.https("0gviiw91l1.execute-api.us-east-1.amazonaws.com","Prod/profile/1/images", {});
    http.get(url).then((response) {
        //print(response.statusCode);
        // print(response.body);
        // Map resJson = json.decode(response.body);
        // print(resJson);
        // for (var k in resJson.keys) {
        //   print('key is ' + k + '.');
        // }
        // for (var v in resJson.values) {
        //   print('value is ' + v.toString() + '.');
        // }
        // resJson.forEach((var k, var v) {
        //   print(k + " => " + v.toString());
        // });
    });

  }


  @override
  Widget build(BuildContext context) {

    SwapCard swapCard = new SwapCard();

    return Scaffold(
      appBar: getAppBar(context, widget.title),
      bottomNavigationBar: getAppBarBottom(context, widget.title),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: swapCard.getSwapCard(context),
            ),
            Text(
              'カードの下の方だよ'
            ),
            Text(
              AppLocalizations.of(context).hello("kazutxt"),
            ),
            Text(
              AppLocalizations.of(context).allow,
            ),
            Text(
              AppLocalizations.of(context).deny,
            ),
            Text(
              '$_counter' + ' LIKE!',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.favorite),
      ),
    );
  }
}
