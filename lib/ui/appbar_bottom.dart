import 'package:flutter/material.dart';
import 'package:matching_app_framework/ui/login.dart';
import 'package:matching_app_framework/ui/profile.dart';

BottomAppBar getAppBarBottom(BuildContext context, text) {
  return BottomAppBar(
    color: Theme.of(context).primaryColor,
    notchMargin: 6.0,
    shape: AutomaticNotchedShape(
      RoundedRectangleBorder(),
      StadiumBorder(
        side: BorderSide(),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.person_outline,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
    )
  );
}