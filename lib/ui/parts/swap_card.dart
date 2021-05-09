import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'dart:async';

import 'package:matching_app_framework/ui/parts/dialog.dart';

import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SwapCard {

  CardController controller;

  List<String> welcomeImages = [
    "assets/mio_imada.jpg",
    "assets/mio_imada2.jpg",
    "assets/mio_imada.jpg",
    "assets/mio_imada2.jpg",
    "assets/mio_imada.jpg",
    "assets/mio_imada2.jpg",
  ];

  TinderSwapCard getSwapCard(BuildContext context) {
    return new TinderSwapCard(
      swipeUp: true,
      swipeDown: true,
      orientation: AmassOrientation.BOTTOM,
      totalNum: welcomeImages.length,
      stackNum: 3,
      swipeEdge: 4.0,
      maxWidth: MediaQuery.of(context).size.width * 0.9,
      maxHeight: MediaQuery.of(context).size.width * 0.9,
      minWidth: MediaQuery.of(context).size.width * 0.8,
      minHeight: MediaQuery.of(context).size.width * 0.8,
      cardBuilder: (context, index) => Card(
        child: Image.asset('${welcomeImages[index]}'),
      ),
      cardController: controller = CardController(),
      swipeUpdateCallback:
          (DragUpdateDetails details, Alignment align) {
        /// Get swiping card's alignment
        print(align.x);

        if (align.x < -5) {
          //Card is LEFT swiping
          showSimpleDialog(context);

        } else if (align.x > 5) {
          //Card is RIGHT swiping
          showAlertDialog(context);
        }
      },
      swipeCompleteCallback:
          (CardSwipeOrientation orientation, int index) {
        /// Get orientation & index of swiped card!
      },
    );
  }
}

