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
        // appBar: getAppBar(context, widget.title),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        bottomNavigationBar: getAppBarBottom(context, widget.title),
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
                child: this.imgSlide,
              ),
              Text(
                widget.profile.lastName + " " + widget.profile.firstName,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                widget.profile.bio,
                style: Theme.of(context).textTheme.bodyText1,
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
              SizedBox(
                width: 230,
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    this.updateImageSlide();
                  },
                  child: Text(
                    this.hogehoge,
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