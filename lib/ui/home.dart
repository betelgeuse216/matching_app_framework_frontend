import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sprintf/sprintf.dart';

import 'dart:io';
import 'dart:typed_data';
import 'dart:async';
import 'dart:ui' as ui;
import 'dart:convert';

import 'package:matching_app_framework/service/profile.dart';

import 'package:matching_app_framework/ui/parts/appbar.dart';
import 'package:matching_app_framework/ui/parts/appbar_bottom.dart';
import 'package:matching_app_framework/ui/parts/swap_card.dart';
import 'package:matching_app_framework/service/profile.dart';

// class Home extends StatefulWidget {
class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;
  String _last_name = '';
  String _first_name = '';
  String _bio = '';
  ProfileService profileService;
  SwapCard swapCard;

  void _incrementCounter() {
    setState(() {
      getTextFromAPi();
      _counter++;
    });
  }

  void getTextFromAPi() {
    // Sample
    // var url = Uri.https("reqres.in","api/users", {'page':'2'});
    // Test
    // - https://0gviiw91l1.execute-api.us-east-1.amazonaws.com/Prod/hello/
    // var url = Uri.https("0gviiw91l1.execute-api.us-east-1.amazonaws.com","Prod/hello/");
    // Profile
    // - https://0gviiw91l1.execute-api.us-east-1.amazonaws.com/Prod/profile/1
    var url = Uri.https("0gviiw91l1.execute-api.us-east-1.amazonaws.com","Prod/profile/1");
    // Profile Image
    // - https://0gviiw91l1.execute-api.us-east-1.amazonaws.com/Prod/profile/1/images
    // var url = Uri.https("0gviiw91l1.execute-api.us-east-1.amazonaws.com","Prod/profile/1/images", {});
    http.get(url).then((response) {
        print(response.statusCode);
        print(response.body);
        Map resJson = json.decode(response.body);
        print(resJson);
        // for (var k in resJson.keys) {
        //   print('key is ' + k + '.');
        // }
        // for (var v in resJson.values) {
        //   print('value is ' + v.toString() + '.');
        // }
        resJson.forEach((var k, var v) {
          print(k + " => " + v.toString());
          v.forEach((var i, var o) {
            print(i.toString() + " => " + o.toString());
          });
          _last_name = v['last_name'];
          _first_name = v['first_name'];
          _bio = v['bio'] + 'なんつってな';
        });
    });

  }

  @override
  Widget build(BuildContext context) {

    this.profileService = new ProfileService();
    this.swapCard = new SwapCard();

    List hoge = this.profileService.getProfileList();
    // sleep(Duration(seconds: 5));
    print(sprintf("hoge: %s", [hoge]));
    // List profileList = profileService.getProfileList();
    // swapCard.setProfileList(profileList);

    return Scaffold(
      appBar: getAppBar(context, AppLocalizations.of(context).title_home),
      bottomNavigationBar: getAppBarBottom(context, widget.title),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.width * 0.05,
              ),
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.05,
              ),
              child: swapCard.getSwapCard(context),
            ),
            // Text(
            //   'カードの下の方だよ'
            // ),
            // Text(
            //   AppLocalizations.of(context).hello("My son"),
            // ),
            // Text(
            //   AppLocalizations.of(context).allow,
            // ),
            // Text(
            //   AppLocalizations.of(context).deny,
            // ),
            Text(
              '$_last_name' + ' ' + '$_first_name',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '' + '$_bio',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '$_counter' + ' LIKE!',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.favorite),
      ),
    );
  }
}
