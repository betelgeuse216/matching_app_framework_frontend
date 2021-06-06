import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
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

import 'package:matching_app_framework/model/profile.dart';
import 'package:matching_app_framework/ui/parts/appbar.dart';
import 'package:matching_app_framework/ui/parts/appbar_bottom.dart';
import 'package:matching_app_framework/ui/parts/swap_card.dart';
import 'package:matching_app_framework/ui/parts/dialog.dart';
import 'package:matching_app_framework/ui/profile.dart';
import 'package:matching_app_framework/service/profile.dart';

import 'dart:async';
import 'package:http/http.dart' as http;

// class Home extends StatefulWidget {
class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;
  String _lastName = '';
  String _firstName = '';
  String _bio = '';
  ProfileService profileService;
  SwapCard swapCard;
  TinderSwapCard cards;
  List<Profile> profiles;
  CardController controller;
  int swapCount = 0;

  @override
  Widget build(BuildContext context) {

    this.profileService = new ProfileService();
    this.swapCard = new SwapCard();
    this._fetchProfilesAwait();
    this.cards = this._getSwapCard(context, this.profiles);
    this._lastName = (this.profiles != null) ? this.profiles[0].lastName : "今田";
    this._firstName = (this.profiles != null) ? this.profiles[0].firstName : "美桜";
    this._bio = (this.profiles != null) ? this.profiles[0].bio : "BIRTHDAY：1997/3/5\nHEIGHT：157 cm\nSHOES：23.5 cm\n趣味：語学勉強\n特技：福岡弁の早口言葉";

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
              child: this.cards,
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

  void _incrementCounter() {
    setState(() {
      _counter++;
      this._fetchProfilesAwait();
      this.cards = this._getSwapCard(context, this.profiles);
    });
  }

  void _fetchProfilesAwait() async {
    Future<List> _futureOfList = this.profileService.fetchProfiles();
    this.profiles = await _futureOfList;
  }

  void _showProfileDetail(Profile profile) {
    this._lastName = profile.lastName;
    this._firstName = profile.firstName;
    this._bio = profile.bio;
  }

  TinderSwapCard _getSwapCard(BuildContext context, List<Profile> profiles) {

    return new TinderSwapCard(
      swipeUp: true,
      swipeDown: true,
      orientation: AmassOrientation.BOTTOM,
      totalNum: (profiles != null) ? profiles.length : 1,
      stackNum: 3,
      swipeEdge: 4.0,
      maxWidth: MediaQuery.of(context).size.width * 0.9,
      maxHeight: MediaQuery.of(context).size.height * 0.9,
      minWidth: MediaQuery.of(context).size.width * 0.6,
      minHeight: MediaQuery.of(context).size.height * 0.6,
      cardBuilder: (context, index) => Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network((profiles != null) ? profiles[index].imageData : "https://matching-app-fw.s3-ap-northeast-1.amazonaws.com/assets/mio_imada.jpg", fit: BoxFit.cover),
              ),
              ListTile(
                leading: Icon(Icons.access_alarms),
                title: Text((profiles != null) ? profiles[index].lastName + " " + profiles[index].firstName : "今田 美桜"),
                subtitle: Text(
                  (profiles != null) ? profiles[index].bio : "LOADING...",
                  style:
                  TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
            ],
          ),
      ),
      cardController: controller = CardController(),
      swipeUpdateCallback:
          (DragUpdateDetails details, Alignment align) {
        /// Get swiping card's alignment
        print(details);
        print(align);
        print(align.x);

        if (align.x < -5) {
          print("swipeUpdateCallback - LEFT");
          //Card is LEFT swiping
          showLikeDialog(context);

        } else if (align.x > 5) {
          print("swipeUpdateCallback - RIGHT");
          //Card is RIGHT swiping
          showDislikeDialog(context);

        }
        else if (align.x == 0) {
          print("swipeUpdateCallback - MIDDLE");
        }
      },
      swipeCompleteCallback:
          (CardSwipeOrientation orientation, int index) {
        /// Get orientation & index of swiped card!
        print("swipeCompleteCallback");
        print(orientation);
        print(index);
        if (orientation == CardSwipeOrientation.RECOVER) {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  ProfilePage(
                    title: AppLocalizations.of(context).hello("Profile Page"),
                    profileId: 4,
                  ),
              )
          );
        }
      },
    );
  }
}
