import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adobe_xd/adobe_xd.dart';

Future<void> showLikeDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text('DISLIKE'),
        children: <Widget>[
        ],
      );
    },
  );
}

Future<void> showDislikeDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('LIKE!'),
        actions: <Widget>[
        ],
      );
    },
  );
}

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