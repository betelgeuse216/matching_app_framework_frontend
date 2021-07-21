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

import 'package:flutter_svg/flutter_svg.dart';
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
  int _selectedIndex = 0;

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
        appBar: getAppBar(context, "__title__"), //@FIXME Set Title.
        // bottomNavigationBar: getAppBarBottom(context, "__title__"), //@FIXME Set Title.
        bottomNavigationBar: getBottomNavigationBar(context, "__title__"), //@FIXME Set Title.

        body: new Stack(
          children: <Widget>[
          // Image.asset(
          //   "assets/mio_imada3.jpg",
          //   fit: BoxFit.cover,
          // ),
          // Text(
          //   "ほげほげ！",
          //   textAlign: TextAlign.end,
          //   overflow: TextOverflow.ellipsis,
          //   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
          // ),
          Center(
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
                        // children: [
                        //   Image.asset(
                        //     "assets/mio_imada1.jpg",
                        //     fit: BoxFit.cover,
                        //   ),
                        //   Image.asset(
                        //     "assets/mio_imada2.jpg",
                        //     fit: BoxFit.cover,
                        //   ),
                        //   Image.asset(
                        //     "assets/mio_imada3.jpg",
                        //     fit: BoxFit.cover,
                        //   ),
                        // ],
                        children: this.slideImages,

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
        ]),
      ),
    );
  }


  BottomNavigationBar getBottomNavigationBar(BuildContext context, text) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.string(
            '<svg viewBox="28.0 619.0 20.0 20.0" ><path transform="translate(28.0, 619.0)" d="M 19.72800636291504 17.29423332214355 L 15.83318901062012 13.39941787719727 C 15.65739440917969 13.22362327575684 15.41909599304199 13.12596035003662 15.16907787322998 13.12596035003662 L 14.53231334686279 13.12596035003662 C 15.61051654815674 11.74695301055908 16.25118827819824 10.01245021820068 16.25118827819824 8.125594139099121 C 16.25118827819824 3.636984586715698 12.61420345306396 0 8.125594139099121 0 C 3.636985063552856 0 0 3.636984586715698 0 8.125594139099121 C 0 12.61420345306396 3.636984586715698 16.25118827819824 8.125594139099121 16.25118827819824 C 10.01245021820068 16.25118827819824 11.74695301055908 15.61051654815674 13.12596035003662 14.53231334686279 L 13.12596035003662 15.16907787322998 C 13.12596035003662 15.41909599304199 13.22362327575684 15.65739440917969 13.39941787719727 15.83318901062012 L 17.29423332214355 19.72800636291504 C 17.66144752502441 20.0952205657959 18.25524139404297 20.0952205657959 18.61854934692383 19.72800636291504 L 19.72409820556641 18.62245559692383 C 20.09131240844727 18.25524139404297 20.09131240844727 17.66144752502441 19.72800636291504 17.29423332214355 Z M 8.125594139099121 13.12596035003662 C 5.363673686981201 13.12596035003662 3.125228643417358 10.8914213180542 3.125228643417358 8.125594139099121 C 3.125228643417358 5.363673686981201 5.359766960144043 3.125228643417358 8.125594139099121 3.125228643417358 C 10.88751602172852 3.125228643417358 13.12596035003662 5.359766960144043 13.12596035003662 8.125594139099121 C 13.12596035003662 10.88751602172852 10.8914213180542 13.12596035003662 8.125594139099121 13.12596035003662 Z" fill="#111111" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.fill,
          ),
          label: 'さがす',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.string(
            '<svg viewBox="28.0 619.0 20.0 20.0" ><path transform="translate(7.5, 619.01)" d="M 29.42662239074707 0.6830438375473022 L 26.98550605773926 5.8542799949646 L 21.52383232116699 6.68620777130127 C 20.54439735412598 6.834627151489258 20.1518726348877 8.096190452575684 20.86215400695801 8.818757057189941 L 24.81354713439941 12.84169960021973 L 23.87897300720215 18.52459144592285 C 23.71074867248535 19.55180358886719 24.74625587463379 20.32124328613281 25.61355018615723 19.84083366394043 L 30.4995174407959 17.15757179260254 L 35.38549041748047 19.84083366394043 C 36.25277709960938 20.31733512878418 37.28829193115234 19.55180358886719 37.12006378173828 18.52458953857422 L 36.18548583984375 12.84169960021973 L 40.13688659667969 8.818756103515625 C 40.84716033935547 8.096189498901367 40.45464324951172 6.834625244140625 39.47519683837891 6.68620777130127 L 34.01352691650391 5.8542799949646 L 31.57242012023926 0.6830438375473022 C 31.13503456115723 -0.2387173175811768 29.86774635314941 -0.2504346072673798 29.42662620544434 0.6830438375473022 Z" fill="#111111" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.fill,
          ),
          label: 'お気に入り',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.string(
            '<svg viewBox="26.0 619.0 25.7 20.0" ><path transform="translate(26.01, 587.0)" d="M 23.74356460571289 47.8125 C 24.97124099731445 46.60267639160156 25.70785140991211 45.08482360839844 25.70785140991211 43.42857360839844 C 25.70785140991211 39.85713958740234 22.29267311096191 36.90624237060547 17.84177780151367 36.37946319580078 C 16.4355297088623 33.80803680419922 13.13195610046387 31.99999809265137 9.279277801513672 31.99999809265137 C 4.149814128875732 31.99999809265137 -0.006435555871576071 35.19642639160156 -0.006435555871576071 39.14285278320313 C -0.006435555871576071 40.79463958740234 0.7301715612411499 42.3125 1.957850098609924 43.52677917480469 C 1.274814486503601 44.89731597900391 0.2926715910434723 45.95981597900391 0.2748143970966339 45.97767639160156 C -0.006435598712414503 46.27678680419922 -0.08679274469614029 46.71428680419922 0.07838582992553711 47.09374237060547 C 0.2391001135110855 47.47321319580078 0.6141001582145691 47.71874237060547 1.024814486503601 47.71874237060547 C 3.413207292556763 47.71874237060547 5.341777324676514 46.81696319580078 6.614099502563477 45.98661041259766 C 7.024813652038574 46.08035278320313 7.448920726776123 46.15178680419922 7.881956100463867 46.20535278320313 C 9.28374195098877 48.76785278320313 12.57392024993896 50.57141876220703 16.4221363067627 50.57141876220703 C 17.35070610046387 50.57141876220703 18.24356460571289 50.46427917480469 19.0917797088623 50.26785278320313 C 20.36409950256348 51.09375 22.28820610046387 52 24.68106460571289 52 C 25.0917797088623 52 25.46231269836426 51.75445556640625 25.62749290466309 51.375 C 25.7882080078125 50.99552917480469 25.71231651306152 50.55802917480469 25.43106460571289 50.25892639160156 C 25.41320610046387 50.24552917480469 24.42660140991211 49.18303680419922 23.74356460571289 47.8125 Z M 6.207849979400635 43.69196319580078 L 5.444456577301025 44.1875 C 4.814992427825928 44.59375 4.172135353088379 44.91517639160156 3.520349979400635 45.14285278320313 C 3.640885591506958 44.93303680419922 3.76142144203186 44.70981597900391 3.877492904663086 44.48213958740234 L 4.569457054138184 43.09375 L 3.462314128875732 42 C 2.859635591506958 41.40177917480469 2.13642144203186 40.42411041259766 2.13642144203186 39.14285278320313 C 2.13642144203186 36.43302917480469 5.408742427825928 34.14285278320313 9.279277801513672 34.14285278320313 C 13.14981555938721 34.14285278320313 16.4221363067627 36.43302917480469 16.4221363067627 39.14285278320313 C 16.4221363067627 41.85267639160156 13.14981555938721 44.14285278320313 9.279277801513672 44.14285278320313 C 8.542670249938965 44.14285278320313 7.806063652038574 44.05803680419922 7.091777801513672 43.89286041259766 L 6.207849025726318 43.69196319580078 Z M 22.23909950256348 46.28571319580078 L 21.13642120361328 47.375 L 21.8283863067627 48.76338958740234 C 21.9444580078125 48.99107360839844 22.06499290466309 49.21427917480469 22.18552780151367 49.42410278320313 C 21.53374290466309 49.19642639160156 20.89088439941406 48.875 20.26142120361328 48.46874237060547 L 19.49802780151367 47.97321319580078 L 18.60963439941406 48.17856597900391 C 17.89534950256348 48.34374237060547 17.15874099731445 48.42856597900391 16.4221363067627 48.42856597900391 C 14.01141929626465 48.42856597900391 11.85963535308838 47.53125 10.56052589416504 46.20981597900391 C 15.08284950256348 45.72767639160156 18.56499290466309 42.75445556640625 18.56499290466309 39.14285278320313 C 18.56499290466309 38.99106597900391 18.5471363067627 38.84375 18.53374290466309 38.69642639160156 C 21.40874290466309 39.34375 23.56499290466309 41.23213958740234 23.56499290466309 43.42857360839844 C 23.56499290466309 44.70981597900391 22.84177780151367 45.6875 22.23909950256348 46.28571319580078 Z" fill="#111111" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.fill,
          ),
          label: 'チャット',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.string(
            '<svg viewBox="28.0 619.0 20.0 20.0" ><path transform="translate(28.0, 611.0)" d="M 10 8 C 4.47580623626709 8 0 12.47580623626709 0 18 C 0 23.52419281005859 4.47580623626709 28 10 28 C 15.52419281005859 28 20 23.52419281005859 20 18 C 20 12.47580623626709 15.52419281005859 8 10 8 Z M 10 11.87096786499023 C 11.95967769622803 11.87096786499023 13.5483865737915 13.45967674255371 13.5483865737915 15.41935443878174 C 13.5483865737915 17.37903213500977 11.95967769622803 18.96774101257324 10 18.96774101257324 C 8.040322303771973 18.96774101257324 6.45161247253418 17.37903213500977 6.45161247253418 15.41935443878174 C 6.45161247253418 13.45967674255371 8.040322303771973 11.87096786499023 10 11.87096786499023 Z M 10 25.74193572998047 C 7.633064270019531 25.74193572998047 5.512096405029297 24.66935348510742 4.092741966247559 22.99193382263184 C 4.85080623626709 21.56451606750488 6.334677696228027 20.58064460754395 8.064516067504883 20.58064460754395 C 8.161290168762207 20.58064460754395 8.258064270019531 20.59677314758301 8.35080623626709 20.625 C 8.875 20.79435539245605 9.42338752746582 20.90322494506836 10 20.90322494506836 C 10.57661247253418 20.90322494506836 11.12903213500977 20.79435348510742 11.64919281005859 20.625 C 11.74193477630615 20.59677314758301 11.83870983123779 20.58064460754395 11.93548393249512 20.58064460754395 C 13.66532230377197 20.58064460754395 15.14919376373291 21.56451606750488 15.90725803375244 22.99193382263184 C 14.48790264129639 24.66935348510742 12.36693572998047 25.74193572998047 10 25.74193572998047 Z" fill="#111111" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.fill,
          ),
          label: 'プロフィール',
        ),
      ],
      // currentIndex: _selectedIndex,
      // selectedItemColor: Colors.amber[800],
      type: BottomNavigationBarType.fixed,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    print("_onItemTapped" + index.toString());
    setState(() {
      _selectedIndex = index;
    });
  }
}