import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sprintf/sprintf.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'dart:convert';

import 'package:matching_app_framework/model/profile.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert' show json;
@JsonSerializable()


class ProfileService {

  String apiDomain = "0gviiw91l1.execute-api.us-east-1.amazonaws.com";
  String apiPathPofileList = "Prod/profile";
  String apiPathProfileOne = "Prod/profile/%s";

  List<String> imageList;
  List profileList;

  List<String> welcomeImages = [
    "assets/mio_imada.jpg",
    "assets/mio_imada2.jpg",
    "assets/mio_imada.jpg",
    "assets/mio_imada2.jpg",
    "assets/mio_imada.jpg",
    "assets/mio_imada2.jpg",
  ];

  var profileListMock;

  Future<List<Profile>> fetchProfiles() async {
    var url = Uri.https(apiDomain, apiPathPofileList);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<Profile> profiles = [];
      // print(response.body);
      // Map<String, dynamic> decodedJson = json.decode(response.body);
      Map<String, dynamic> decodedJson = json.decode(response.body);
      var profilesJson = decodedJson['profiles'];
      // print(profilesJson);
      // Map<String, dynamic> decodedJson = json.decode(response.body);
      print(profilesJson[0]['last_name']);
      int i = 0;
      profilesJson.forEach((dynamic p){
        for(var profileJson in profilesJson){
          i++;
          profileJson['image_data'] = 'https://d1t742d15gmb5g.cloudfront.net/assets/mio_imada' + i.toString() + '.jpg';
          Profile p = Profile.fromJson(profileJson);
          profiles.add(p);
          print(profileJson['last_name'] + "さんは、" + p.firstName + "さんです。");
        }
      });
      return profiles;
    } else {
      throw Exception('Failed to load album');
    }
  }

  createProfileListMock() {
    for (var i = 1; i <= 10; i++) {
      this.profileListMock['profiles'] = {
        "id": i,
        "account_id": i,
        "last_name": "苗字" + i.toString(),
        "first_name": "名前" + i.toString(),
        "bio": "自己紹介" + i.toString(),
        "created_on": "2021-05-08 08:29:28.900289",
        "updated_on": "2021-05-08 08:29:28.900289",
        "image_url": "https://matching-app-fw.s3-ap-northeast-1.amazonaws.com/assets/mio_imada" + i.toString() + ".jpg",
      };
    }
  }

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


    // for (var i = 0; i < profileList['profiles'].length; i++) {
    //   print("----------------------------------------------");
    //   // print(profileList['profiles'][i]["last_name"]);
    //   print(profileList['profiles'][i]["image_data"]);
    //   print("----------------------------------------------");
    // }
    // this.profileList
    // this.profileList = profileList['profiles'];

    return this.profileList;
  }

  List<String> getProfileImageListFirst() {
    // Profile List
    // https://0gviiw91l1.execute-api.us-east-1.amazonaws.com/Prod/profile
    var url = Uri.https("0gviiw91l1.execute-api.us-east-1.amazonaws.com","Prod/profile");

    http.get(url).then((response) {
      // print(response.statusCode);
      // print(response.body);
      print(1);
      var resJson = json.decode(response.body);
      this.profileList = resJson['profiles'];
      // print(this.profileList);
      print(this.profileList.length);
      // print(resJson);
      // resJson.forEach((var k, var v) {
      //   print(k + " => " + v.toString());
      //   v.forEach((var i, var o) {
      //     print(i.toString() + " => " + o.toString());
      //   });
      // });
    });

    this.imageList = this.welcomeImages;

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