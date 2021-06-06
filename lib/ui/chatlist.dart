import 'package:flutter/material.dart';

import 'package:matching_app_framework/ui/chat.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 230,
              height: 70,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatPage(title: AppLocalizations.of(context).hello("Chat")),
                      )
                  );
                },
                child: Text(
                  'OPEN CHAT',
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
