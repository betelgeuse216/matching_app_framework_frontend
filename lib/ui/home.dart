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
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: this.cards,
            ),
          ),
          // Text(
          //   '$_counter' + ' LIKE!',
          //   style: Theme.of(context).textTheme.headline4,
          // ),
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 100.0),
        child: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.favorite),
        ),
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
      maxWidth: MediaQuery.of(context).size.width,
      maxHeight: MediaQuery.of(context).size.height,
      minWidth: MediaQuery.of(context).size.width * 0.8,
      minHeight: MediaQuery.of(context).size.height * 0.8,
      cardBuilder: (context, index) => Card(
        shadowColor: Colors.grey.withOpacity(0.5),
        elevation: 8,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          // side: BorderSide(
          //   color: Colors.grey.withOpacity(0.5),
          //   width: 1,
          // ),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            // ClipRRect(
            //   borderRadius: BorderRadius.circular(15.0),
            //   child: Image.network((profiles != null) ? profiles[index].imageData : "https://matching-app-fw.s3-ap-northeast-1.amazonaws.com/assets/mio_imada.jpg", fit: BoxFit.cover),
            // ),
            Expanded(
              flex: 1,
              child: Ink.image(
                image: NetworkImage(
                  'https://matching-app-fw.s3-ap-northeast-1.amazonaws.com/assets/mio_imada3.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: RichText(
                text: TextSpan(
                  text: (profiles != null) ? profiles[index].lastName + " " + profiles[index].firstName : "今田 美桜",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '　24歳 / 大阪市（ここから5km）',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
              ),
            ),
            // ListTile(
            //   leading: Icon(Icons.access_alarms),
            //   title: Text((profiles != null) ? profiles[index].lastName + " " + profiles[index].firstName : "今田 美桜"),
            //   subtitle: Text(
            //     (profiles != null) ? profiles[index].bio : "BIRTHDAY：1997/3/5\nHEIGHT：157 cm\nSHOES：23.5 cm\n趣味：語学勉強\n特技：福岡弁の早口言葉",
            //     style:
            //     TextStyle(color: Colors.black.withOpacity(0.6)),
            //   ),
            // ),
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
