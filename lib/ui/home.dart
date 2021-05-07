import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';

import 'dart:typed_data';
import 'dart:async';
import 'dart:ui' as ui;

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
  }

  @override
  Widget build(BuildContext context) {

    SwapCard swapCard = new SwapCard();

    return Scaffold(
      appBar: getAppBar(context, widget.title),
      bottomNavigationBar: getAppBarBottom(context, widget.title),
      body: Center(
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     Text(
        //       '$_counter' + ' LIKE!',
        //       style: Theme.of(context).textTheme.headline4,
        //     ),
        //     Image.asset(
        //         'assets/mio_imada2.jpg'
        //     ),
        //     // swapCard.getSwapCard(context),
        //   ],
        // ),
        child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: swapCard.getSwapCard(context),
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
