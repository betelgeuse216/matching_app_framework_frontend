import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MypagePage extends StatelessWidget {
  final Color pannelColor;
  final String title;

  MypagePage({@required this.pannelColor, @required this.title});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text(title),
        // ),
        body: new Stack(
            children: <Widget>[
              Container(
                child: SingleChildScrollView( // SingleChildScrollViewで子ウィジェットをラップ
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                      SizedBox(
                        height: 80,
                        width: 100,
                      ),

                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          // プロフィール画像
                          Center(
                            child: Container(
                              width: 120.0,
                              height: 120.0,
                              margin: const EdgeInsets.only(bottom: 20.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/mio_imada1.jpg")
                                  )
                              ),
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.only(bottom: 5.0),
                            child: Text(
                              "べっちー,38歳",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0
                              ),
                            ),
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: <Widget>[
                          //     Icon(  // 2.2列目
                          //       Icons.circle,
                          //       size: 18.0,
                          //       color: Color(0xff6AFC9D),
                          //     ),
                          //     Container(
                          //       margin: const EdgeInsets.only(left: 5.0),
                          //       // padding: EdgeInsets.only(top: 5),
                          //       child: Text(
                          //         "10分前にオンライン",
                          //         style: TextStyle(
                          //             fontSize: 12.0
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 30.0),
                            padding: EdgeInsets.only(
                                left: 30,
                                right: 30
                            ),
                            child: Text(
                              "大阪市（ここから5km）",
                              style: TextStyle(fontSize: 12.0, color: Colors.grey),
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {},
                                // 表示アイコン
                                icon: Icon(Icons.settings),
                                // アイコン色
                                color: Colors.grey[350],
                                // サイズ
                                iconSize: 36.0,
                              ),
                              IconButton(
                                onPressed: () {},
                                // 表示アイコン
                                icon: Icon(Icons.add_a_photo),
                                // アイコン色
                                color: Colors.pink,
                                // サイズ
                                iconSize: 36.0,
                              ),
                              IconButton(
                                onPressed: () {},
                                // 表示アイコン
                                icon: Icon(Icons.thumb_up),
                                // アイコン色
                                color: Colors.grey[350],
                                // サイズ
                                iconSize: 36.0,
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 30,
                            width: 100,
                          ),

                          Container(
                            padding: EdgeInsets.only(left: 30, right: 30),
                            child: Text(
                              "恥の多い生涯を送って来ました。自分には、人間の生活というものが、見当つかないのです。自分は東北の田舎に生れましたので、汽車をはじめて見たのは、よほど大きくなってからでした。",
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ),
                          const Divider(  // 区切り線
                            height: 50,
                            thickness: 1,
                            indent: 30,
                            endIndent: 30,
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 5.0),
                            padding: EdgeInsets.only(left: 30, right: 30),
                            child: Text(
                              "趣味など",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 30, right: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Wrap(
                                    alignment: WrapAlignment.start,
                                    spacing: 10.0,
                                    runSpacing: 0.0,
                                    direction: Axis.horizontal,
                                    children: <Widget>[
                                      Chip(
                                        label: const Text('お酒'),
                                      ),
                                      Chip(
                                        label: const Text('カフェ'),
                                      ),
                                      Chip(
                                        label: const Text('スイーツ'),
                                      ),
                                      Chip(
                                        label: const Text('旅行'),
                                      ),
                                      Chip(
                                        label: const Text('映画'),
                                      ),
                                      Chip(
                                        label: const Text('ライブ'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(  // 区切り線
                        height: 50,
                        thickness: 1,
                        indent: 30,
                        endIndent: 30,
                      ),

                      SizedBox(
                        height: 50,
                        width: 100,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}