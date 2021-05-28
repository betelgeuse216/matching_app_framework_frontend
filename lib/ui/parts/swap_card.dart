import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'dart:async';

import 'package:matching_app_framework/ui/parts/dialog.dart';
import 'package:matching_app_framework/model/profile.dart';

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

  List profileList;

  void setProfileList(List profileList) {
    this.profileList = profileList;
    if (this.profileList != null) {
      for (var i = 0; i < this.profileList.length; i++) {
        //print(this.profileList[i]['image_data']);
      }
    }
  }

  TinderSwapCard getSwapCard(BuildContext context, List<Profile> profiles) {

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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.network((profiles != null) ? profiles[index].imageData : "https://matching-app-fw.s3-ap-northeast-1.amazonaws.com/assets/mio_imada.jpg", fit: BoxFit.cover),
        ),
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
            ///
      },
    );
  }
}

