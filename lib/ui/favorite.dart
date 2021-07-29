import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui';

class FavoritePage extends StatelessWidget {
  final Color pannelColor;
  final String title;

  FavoritePage({@required this.pannelColor, @required this.title});

  @override
  Widget build(BuildContext context) {
    var list = [
      _photoItem("mio_imada1"),
      _photoItem("mio_imada2"),
      _photoItem("mio_imada3"),
      _photoItem("mio_imada4"),
      _photoItem("mio_imada1"),
      _photoItem("mio_imada2"),
      _photoItem("mio_imada3"),
      _photoItem("mio_imada4"),
      _photoItem("mio_imada1"),
      _photoItem("mio_imada2"),
      _photoItem("mio_imada3"),
      _photoItem("mio_imada4"),
    ];
    return MaterialApp(
        home: Scaffold(
            // appBar: AppBar(
            //   title: Text('GridView'),
            // ),
            body: Padding(
                padding: EdgeInsets.all(10),
                child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.7,
                    children: list
                ),
            ),
        )
    );
  }

  Widget _photoItem(String image) {
    var assetsImage = "assets/" + image + ".jpg";
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.asset(assetsImage, fit: BoxFit.cover,),
      ),
    );
  }
}