import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'dart:ui' as ui;
import 'dart:convert';

import 'package:matching_app_framework/ui/parts/appbar.dart';
import 'package:matching_app_framework/ui/parts/appbar_bottom.dart';

void main() => runApp(ProfilePage());

class ProfilePage extends StatelessWidget {

  ProfilePage({Key key, this.title, this.profileId}) : super(key: key);

  final String title;
  final int profileId;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        appBar: getAppBar(context, title),
        bottomNavigationBar: getAppBarBottom(context, title),
        body:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.width * 0.05,
                ),
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.05,
                ),
                child:
                ImageSlideshow(

                  /// Width of the [ImageSlideshow].
                  width: double.infinity,

                  /// Height of the [ImageSlideshow].
                  height: 500,

                  /// The page to show when first creating the [ImageSlideshow].
                  initialPage: 0,

                  /// The color to paint the indicator.
                  indicatorColor: Colors.blue,

                  /// The color to paint behind th indicator.
                  indicatorBackgroundColor: Colors.grey,

                  /// The widgets to display in the [ImageSlideshow].
                  /// Add the sample image file into the images folder
                  children: [
                    Image.asset(
                      "assets/mio_imada.jpg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "assets/mio_imada2.jpg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "assets/mio_imada.jpg",
                      fit: BoxFit.cover,
                    ),
                  ],

                  /// Called whenever the page in the center of the viewport changes.
                  onPageChanged: (value) {
                    print('Page changed: $value');
                  },

                  /// Auto scroll interval.
                  /// Do not auto scroll with null or 0.
                  autoPlayInterval: 5000,
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
      ),
    );
  }
}

// class ProfilePage extends StatefulWidget {
//   ProfilePage({Key key, this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         // title: Text("Profile Page"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
