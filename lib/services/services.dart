import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/constants.dart';
import 'package:projects/models/post.dart';
import 'package:http/http.dart' as http;
import 'package:projects/models/users.dart';

class APiService {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    try {
      var url = Uri.parse("$baseUrl/posts");
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var json = response.body;
        return postFromJson(json);
      }
    } on SocketException catch (e) {
      Get.snackbar("Message", "No Internet Connection",
          snackPosition: SnackPosition.TOP,
          backgroundColor: secondaryColor,
          colorText: Colors.white);
      //customToast(msg: "No internet connection available", context: ctx);
      print(e.toString());
    }
  }

  Future<List<User>?> getUsers() async {
    var client = http.Client();

    try {
      var url = Uri.parse("$baseUrl/users");
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var json = response.body;
        return userFromJson(json);
      }
    } on SocketException catch (e) {
      Get.snackbar("Message", "No Internet Connection",
          snackPosition: SnackPosition.TOP,
          backgroundColor: secondaryColor,
          colorText: Colors.white);
      //customToast(msg: "No internet connection available", context: ctx);
      print(e.toString());
    }
  }


}
