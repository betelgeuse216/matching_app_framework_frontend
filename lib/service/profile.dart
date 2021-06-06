import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:matching_app_framework/model/profileImage.dart';
import 'package:sprintf/sprintf.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'dart:convert';

import 'package:matching_app_framework/model/profile.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert' show json;
@JsonSerializable()


class ProfileService {

  //https://cmox3c0jke.execute-api.ap-northeast-2.amazonaws.com/Prod/profile
  String apiDomain = "cmox3c0jke.execute-api.ap-northeast-2.amazonaws.com";
  String apiPathProfileList = "Prod/profile";
  String apiPathProfileOne = "Prod/profile/%s";
  String apiPathProfileImages = "Prod/profile/%s/images";

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
    var url = Uri.https(apiDomain, apiPathProfileList);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<Profile> profiles = [];
      Map<String, dynamic> decodedJson = json.decode(response.body);
      var profilesJson = decodedJson['profiles'];
      int i = 0;
      profilesJson.forEach((dynamic p){
        for(var profileJson in profilesJson){
          i++;
          // print(i);
          profileJson['image_data'] = 'https://d1t742d15gmb5g.cloudfront.net/assets/mio_imada' + i.toString() + '.jpg';
          Profile p = Profile.fromJson(profileJson);
          profiles.add(p);
        }
      });
      return profiles;
    } else {
      throw Exception('Failed to load album');
    }
  }

  List getProfileList() {

    // Profile List
    // https://cmox3c0jke.execute-api.ap-northeast-2.amazonaws.com/Prod/profile
    var url = Uri.https(apiDomain, apiPathProfileList);

    http.get(url).then((response) {

      var resJson = json.decode(response.body);
      this.profileList = resJson['profiles'];
      if (this.profileList != null) {
        print(sprintf("Profile List counts %s", [this.profileList.length]));
      } else {
        print("Can't get Profile List");
      }
    });

    return this.profileList;
  }

  Map getProfile(int profileId) {

    Map resJson = {};
    Map profile = {};

    // Profile
    // - https://cmox3c0jke.execute-api.ap-northeast-2.amazonaws.com/Prod/profile/1
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

  Future<List<ProfileImage>> getProfileImages(int profileId) async {
    print(apiDomain + '/' + sprintf(apiPathProfileImages, [profileId.toString()]));

    // Profile Image
    // - https://cmox3c0jke.execute-api.ap-northeast-2.amazonaws.com/Prod/profile/1/images
    print(apiDomain + '/' + sprintf(apiPathProfileImages, [profileId.toString()]));
    var url = Uri.https(apiDomain, sprintf(apiPathProfileImages, [profileId.toString()]), {});
    final response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      List<ProfileImage> profileImages = [];
      print(response.body);
      Map<String, dynamic> decodedJson = json.decode(response.body);
      print(decodedJson['images']);
      var profileImagesJson = decodedJson['images'];
      print("--Start-----------------");
      for (var imageJson in profileImagesJson) {
        print(imageJson);
        ProfileImage p = ProfileImage.fromJson(imageJson);
        profileImages.add(p);
      }
      print("--Finished-----------------");
      return profileImages;
    } else {
      throw Exception('Failed to load album');
    }
  }
}