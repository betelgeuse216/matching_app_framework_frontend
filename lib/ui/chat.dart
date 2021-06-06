import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

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
