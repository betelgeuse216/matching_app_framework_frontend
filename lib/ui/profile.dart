import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:matching_app_framework/model/profile.dart';
import 'package:matching_app_framework/model/profileImage.dart';
import 'package:matching_app_framework/service/profile.dart';

import 'dart:ui' as ui;
import 'dart:convert';

import 'package:matching_app_framework/ui/parts/appbar.dart';
import 'package:matching_app_framework/ui/parts/appbar_bottom.dart';
import 'package:sprintf/sprintf.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key, this.title, this.profileId, this.profile, this.profileService}) : super(key: key);

  final String title;
  final int profileId;
  final Profile profile;
  final ProfileService profileService;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
// class ProfilePage extends StatelessWidget {

  // ProfilePage({Key key, this.title, this.profileId, this.profile, this.profileService}) : super(key: key);

  // final String title;
  // final int profileId;
  // final Profile profile;
  // final ProfileService profileService;
  // int profileId;
  List<ProfileImage> profileImages;
  List<Image> slideImages;
  ImageSlideshow imgSlide;
  String hogehoge = 'GET!';

  void _fetchProfileImagesAwait(int profileId) async {
    Future<List<ProfileImage>> _futureOfList = widget.profileService.getProfileImages(profileId);
    this.profileImages = await _futureOfList;
  }

  List<Image> _getProfileImagesSlide() {
    List<Image> slideImages = [];

    if (profileImages != null && profileImages.length > 0) {
      for (ProfileImage pimg in profileImages) {
        slideImages.add(
            Image.network(
              pimg.imageUrl,
              fit: BoxFit.cover,
            ),
        );
      }
    } else {

      slideImages = [
        Image.asset(
          "assets/mio_imada1.jpg",
          fit: BoxFit.cover,
        ),
        Image.asset(
          "assets/mio_imada2.jpg",
          fit: BoxFit.cover,
        ),
        Image.asset(
          "assets/mio_imada3.jpg",
          fit: BoxFit.cover,
        ),
        Image.asset(
          "assets/mio_imada1.jpg",
          fit: BoxFit.cover,
        ),
        Image.asset(
          "assets/mio_imada2.jpg",
          fit: BoxFit.cover,
        ),
        Image.asset(
          "assets/mio_imada3.jpg",
          fit: BoxFit.cover,
        ),
      ];
    }

    return slideImages;
  }

  ImageSlideshow _getImageSlideShow() {

    this.slideImages = this._getProfileImagesSlide();
    print(sprintf("Slide Image Count : %s.", [this.slideImages.length.toString()]));

    return ImageSlideshow(

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
      children: this.slideImages,

      /// Called whenever the page in the center of the viewport changes.
      onPageChanged: (value) {
        print('Page changed: $value');
      },

      /// Auto scroll interval.
      /// Do not auto scroll with null or 0.
      autoPlayInterval: 5000,
    );
  }

  void updateImageSlide() {
    setState(() {
      this.imgSlide = this._getImageSlideShow();
      print(this.imgSlide);
      this.hogehoge += '!';
    });
  }

  @override
  Widget build(BuildContext context) {

    //get profile images
    print("--- ABC Open Profile Page");
    print(widget.profileId);
    print(widget.profileId);
    print(widget.profile.lastName);
    print(widget.profile.firstName);
    print(widget.profile.imageData);
    // print(this.imageList);
    // imageList.forEach((image) {
    //   print(image.imageUrl);
    // });
    this._fetchProfileImagesAwait(widget.profileId);
    // print(this.profileImages);
    if (this.profileImages != null) {
      print(this.profileImages.length);
    }
    updateImageSlide();
    print("--- XYZ - Open Profile Page");

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        appBar: getAppBar(context, title),
        bottomNavigationBar: getAppBarBottom(context, title),
        body: Center(
          child: SingleChildScrollView( // SingleChildScrollViewで子ウィジェットをラップ
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  margin: EdgeInsets.only(
                    bottom: 15,
                  ),
                  padding: EdgeInsets.all(15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: ImageSlideshow(

                      /// Width of the [ImageSlideshow].
                      width: MediaQuery.of(context).size.width,

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
                          "assets/mio_imada1.jpg",
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          "assets/mio_imada2.jpg",
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          "assets/mio_imada3.jpg",
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
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 4.0),
                      padding: EdgeInsets.only(
                        left:15,
                        right: 15
                      ),
                      child: Text(
                        "山田 花子　24歳",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 30.0),
                      padding: EdgeInsets.only(
                        left:15,
                        right: 15
                      ),
                      child: Text(
                        "大阪市（ここから5km）",
                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 30.0),
                      padding: EdgeInsets.only(left:15, right: 15),
                      child: Text(
                        "恥の多い生涯を送って来ました。自分には、人間の生活というものが、見当つかないのです。自分は東北の田舎に生れましたので、汽車をはじめて見たのは、よほど大きくなってからでした。",
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ],
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
      ),
    );
  }
}