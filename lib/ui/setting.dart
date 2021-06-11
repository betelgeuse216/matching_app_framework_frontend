import 'package:flutter/material.dart';

import 'package:matching_app_framework/ui/parts/appbar.dart';
import 'package:matching_app_framework/ui/parts/appbar_bottom.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  String title;

  SettingPage({String title}) {
    this.title = title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   "プロフィール",
            //   style: Theme.of(context).textTheme.headline6,
            // ),
            // Text(
            //   "アカウント",
            //   style: Theme.of(context).textTheme.headline6,
            // ),
            // Text(
            //   "プライバシー管理",
            //   style: Theme.of(context).textTheme.headline6,
            // ),
            // Text(
            //   "年齢確認",
            //   style: Theme.of(context).textTheme.headline6,
            // ),
            // Text(
            //   "通知",
            //   style: Theme.of(context).textTheme.headline6,
            // ),
            SizedBox(
              width: 230,
              height: 70,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text(
                  'CLOSE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.black, //押したときの色！！
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
