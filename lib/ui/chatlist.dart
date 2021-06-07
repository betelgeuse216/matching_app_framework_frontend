import 'package:flutter/material.dart';

import 'package:matching_app_framework/ui/chat.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:matching_app_framework/ui/parts/appbar_bottom.dart';
import 'package:matching_app_framework/ui/parts/tile.dart';

class ChatListPage extends StatefulWidget {
  ChatListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: getAppBarBottom(context, widget.title),
      body: ListView(
        // padding: const EdgeInsets.all(8),
          children: <Widget>[
            Tile(
              icon: Icons.person,
              username: "山田 花子",
              message: "はじめまして！\nマッチングありがとうございます😆",
            ),
            Tile(
              icon: Icons.person,
              username: "山田 花子",
              message: "はじめまして！\nマッチングありがとうございます😆",
            ),
            Tile(
              icon: Icons.person,
              username: "山田 花子",
              message: "はじめまして！\nマッチングありがとうございます😆",
            ),
            Tile(
              icon: Icons.person,
              username: "山田 花子",
              message: "はじめまして！\nマッチングありがとうございます😆",
            ),
            Tile(
              icon: Icons.person,
              username: "山田 花子",
              message: "はじめまして！\nマッチングありがとうございます😆",
            ),
          ]
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       SizedBox(
      //         width: 230,
      //         height: 70,
      //         child: ElevatedButton(
      //           onPressed: () {
      //             Navigator.push(
      //                 context,
      //                 MaterialPageRoute(builder: (context) => ChatPage(title: AppLocalizations.of(context).hello("Chat")),
      //                 )
      //             );
      //           },
      //           child: Text(
      //             'OPEN CHAT',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 30,
      //             ),
      //           ),
      //           style: ElevatedButton.styleFrom(
      //             onPrimary: Colors.black, //押したときの色！！
      //           ),
      //         ),
      //       ),
      //       SizedBox(
      //         width: 230,
      //         height: 70,
      //         child: ElevatedButton(
      //           onPressed: () {
      //             Navigator.of(context).pop(false);
      //           },
      //           child: Text(
      //             'CLOSE',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 30,
      //             ),
      //           ),
      //           style: ElevatedButton.styleFrom(
      //             onPrimary: Colors.black, //押したときの色！！
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
