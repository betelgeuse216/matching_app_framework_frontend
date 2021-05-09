import 'package:flutter/material.dart';
import 'dart:async';

Future<void> showSimpleDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text('DISLIKE! WHY?'),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context, 1),
            child: const Text('Select1'),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context, 2),
            child: const Text('Select2'),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context, 3),
            child: const Text('Select3'),
          ),
        ],
      );
    },
  );
}

Future<void> showAlertDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirm'),
        content: Text('LIKE! OK?'),
        actions: <Widget>[
          Image.asset('assets/logo.jpg'),
          // Pinned.fromPins(
          //   Pin(start: 0.0, end: 0.0),
          //   Pin(start: 0.0, end: 0.0),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
          //       color: const Color(0xffffd43b),
          //     ),
          //   ),
          // ),
          // Pinned.fromPins(
          //   Pin(size: 55.0, middle: 0.5077),
          //   Pin(size: 55.0, middle: 0.5077),
          //   child:
          //   // Adobe XD layer: 'star-solid' (shape)
          //   SvgPicture.string(
          //     '<svg viewBox="33.0 33.0 55.0 55.0" ><path transform="translate(12.5, 33.01)" d="M 45.04905319213867 1.900556802749634 L 38.33598327636719 16.12145614624023 L 23.31637954711914 18.40925788879395 C 20.6229305267334 18.81740951538086 19.54349327087402 22.28670692443848 21.49676322937012 24.27376365661621 L 32.36309432983398 35.33685302734375 L 29.79300880432129 50.96481323242188 C 29.33039474487305 53.78964233398438 32.17803955078125 55.90560531616211 34.56309509277344 54.58447647094727 L 47.99951171875 47.20550918579102 L 61.43593597412109 54.58447647094727 C 63.82099151611328 55.89485549926758 66.66864013671875 53.78964233398438 66.20603179931641 50.96480560302734 L 63.63593673706055 35.33685302734375 L 74.50227355957031 24.27376174926758 C 76.45554351806641 22.28670501708984 75.37610626220703 18.81740570068359 72.68264007568359 18.40925598144531 L 57.66305541992188 16.12145614624023 L 50.94999313354492 1.900556802749634 C 49.74717712402344 -0.634286105632782 46.26213836669922 -0.6665085554122925 45.04906845092773 1.900556802749634 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
          //     allowDrawingOutsideViewBox: true,
          //     fit: BoxFit.fill,
          //   ),
          // ),
          TextButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(0),
          ),
          TextButton(
            child: Text('OK'),
            onPressed: () => Navigator.of(context).pop(1),
          ),
        ],
      );
    },
  );
}

Future<void> showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('This is a demo alert dialog.'),
              Text('Would you like to approve of this message?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}