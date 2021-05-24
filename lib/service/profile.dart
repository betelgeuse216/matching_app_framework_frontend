import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sprintf/sprintf.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'dart:convert';

class ProfileService {

  String apiDomain = "0gviiw91l1.execute-api.us-east-1.amazonaws.com";
  String apiPathPofileList = "Prod/profile";
  String apiPathProfileOne = "Prod/profile/%s";


  Map imageList;
  List profileList;

  List getProfileList() {

    // Profile List
    // https://0gviiw91l1.execute-api.us-east-1.amazonaws.com/Prod/profile
    var url = Uri.https(apiDomain, apiPathPofileList);

    http.get(url).then((response) {
      // print(response.statusCode);
      // print(response.body);
      var resJson = json.decode(response.body);
      this.profileList = resJson['profiles'];
      if (this.profileList != null) {
        print(sprintf("Profile List counts %s", [this.profileList.length]));
      } else {
        print("Can't get Profile List");
      }
      // print(resJson);
      // resJson.forEach((var k, var v) {
      //   print(k + " => " + v.toString());
      //   v.forEach((var i, var o) {
      //     print(i.toString() + " => " + o.toString());
      //   });
      // });
    });

    return this.profileList;
  }

  Map getProfileImageListFirst() {
    // Profile List
    // https://0gviiw91l1.execute-api.us-east-1.amazonaws.com/Prod/profile
    var url = Uri.https("0gviiw91l1.execute-api.us-east-1.amazonaws.com","Prod/profile");

    http.get(url).then((response) {
      // print(response.statusCode);
      // print(response.body);
      print(1);
      var resJson = json.decode(response.body);
      this.profileList = resJson['profiles'];
      print(this.profileList);
      print(this.profileList.length);
      // print(resJson);
      // resJson.forEach((var k, var v) {
      //   print(k + " => " + v.toString());
      //   v.forEach((var i, var o) {
      //     print(i.toString() + " => " + o.toString());
      //   });
      // });
    });

    return this.imageList;
  }


  Map getProfile(int profileId) {

    Map resJson = {};
    Map profile = {};

    // Profile
    // - https://0gviiw91l1.execute-api.us-east-1.amazonaws.com/Prod/profile/1
    var url = Uri.https(apiDomain, sprintf(apiPathProfileOne, [profileId.toString()]));

    http.get(url).then((response) {
      print(response.statusCode);
      print(response.body);
      resJson = json.decode(response.body);
      // print(resJson);
      // resJson.forEach((var k, var v) {
      //   print(k + " => " + v.toString());
      //   v.forEach((var i, var o) {
      //     print(i.toString() + " => " + o.toString());
      //   });
      // });
      return resJson['profile'];
    });

    resJson.forEach((var k, var v) {
      print(k + " => " + v.toString());
      v.forEach((var i, var o) {
        print(i.toString() + " => " + o.toString());
      });
    });
    profile = resJson['profile'];

    return profile;
  }

  Map getProfileImage(int profileId) {

    Map resJson = {};
    Map profileImages = {};

    // Profile Image
    // - https://0gviiw91l1.execute-api.us-east-1.amazonaws.com/Prod/profile/1/images
    var url = Uri.https("0gviiw91l1.execute-api.us-east-1.amazonaws.com","Prod/profile/" + profileId.toString() +  "/images", {});

    http.get(url).then((response) {
      print(response.statusCode);
      print(response.body);
      resJson = json.decode(response.body);
      print(resJson);
      resJson.forEach((var k, var v) {
        print(k + " => " + v.toString());
        v.forEach((var i, var o) {
          print(i.toString() + " => " + o.toString());
        });
      });
    });

    profileImages = resJson['images'];

    return profileImages;
  }
}