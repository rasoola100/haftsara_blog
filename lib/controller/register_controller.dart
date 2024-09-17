import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:haftsara_blog/components/api_url_constant.dart';
import 'package:haftsara_blog/components/storage_const.dart';
import 'package:haftsara_blog/services/dio_service.dart';
import 'package:haftsara_blog/view/home_screen.dart';

class RegisterController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activeatedCodeTextEditingController =
      TextEditingController();
  var email = '';
  var user_id = '';
  regeiter() async {
    Map<String, dynamic> map = {
      'email': emailTextEditingController.text,
      'command': 'register'
    };
    var response =
        await DioService().postMethod(map, ApiUrlConstant.postRegister);
    email = emailTextEditingController.text;
    user_id = response.data['user_id'];
    // print(response);
  }

  verify() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': user_id,
      'code': activeatedCodeTextEditingController.text,
      'command': 'verify'
    };
    // print(map);
    var response =
        await DioService().postMethod(map, ApiUrlConstant.postRegister);
    // print(response.data);
    if (response.data['response'] == 'verified') {
      var box = GetStorage();
      box.write(token, response.data['token']);
      box.write(userId, response.data['user_id']);

      debugPrint(
        response.data['token'] == box.read(token) ? 'yes' : 'noooo'
      );
      debugPrint(box.read(token));
      debugPrint(box.read(userId));
      
      Get.to(() => const HomeScreen());
    } else {
      log('error code');
    }
  }
}
