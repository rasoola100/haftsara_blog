import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:haftsara_blog/components/api_url_constant.dart';
import 'package:haftsara_blog/components/storage_const.dart';
import 'package:haftsara_blog/services/dio_service.dart';
import 'package:haftsara_blog/view/home_screen.dart';
import 'package:haftsara_blog/view/register_intro.dart';

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
    var response = await DioService().postMethod(map, ApiUrlConstant.postRegister);

    var status = response.data['response'];

    switch (status) {
      case 'verified':
        var box = GetStorage();
        box.write(token, response.data['token']);
        box.write(userId, response.data['user_id']);
        // Get.to(() => const HomeScreen());
        Get.offAll(() => const HomeScreen());
        debugPrint('ok login');
        break;
      case 'incorrect_code':
        Get.snackbar('title', 'کد وارد شده صحیح نیست!');
        break;
      case 'espired':
        Get.snackbar('title', 'کد وارد شده منقضی شده است!');
        break;
    }
  }

  checkLogin() {
    if (GetStorage().read(token) == null) {
      Get.to(() => RegisterIntro());
    } else {
      debugPrint('logined');
    }
  }
}
