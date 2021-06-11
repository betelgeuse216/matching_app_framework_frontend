import 'package:flutter/material.dart';

import 'package:matching_app_framework/ui/parts/appbar.dart';
import 'package:matching_app_framework/ui/parts/appbar_bottom.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  String username;

  ChatPage({String username}) {
    this.username = username;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('山田 花子'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => {},
            ),
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () => {},
            ),
            IconButton(
              icon: Icon(Icons.photo),
              onPressed: () => {},
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'メッセージを入力してください',
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.mic),
              onPressed: () => {},
            ),
          ],
        ),
      ),
      body: Center(child: Text("Chat")),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(widget.title),
  //     ),
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           SizedBox(
  //             width: 230,
  //             height: 70,
  //             child: ElevatedButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop(false);
  //               },
  //               child: Text(
  //                 'CLOSE',
  //                 style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 30,
  //                 ),
  //               ),
  //               style: ElevatedButton.styleFrom(
  //                 onPrimary: Colors.black, //押したときの色！！
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
