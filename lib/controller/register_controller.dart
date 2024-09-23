import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:haftsara_blog/components/api_url_constant.dart';
import 'package:haftsara_blog/components/storage_const.dart';
import 'package:haftsara_blog/gen/assets.gen.dart';
import 'package:haftsara_blog/main.dart';
import 'package:haftsara_blog/services/dio_service.dart';
import 'package:haftsara_blog/view/home_screen.dart';
import 'package:haftsara_blog/view/register_intro.dart';

class RegisterController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activeatedCodeTextEditingController =
      TextEditingController();
  var email = '';
  var userId = '';
  regeiter() async {
    Map<String, dynamic> map = {
      'email': emailTextEditingController.text,
      'command': 'register'
    };
    var response =
        await DioService().postMethod(map, ApiUrlConstant.postRegister);
    if (response.statusCode == 200) {
      email = emailTextEditingController.text;
      userId = response.data['user_id'];
    } else if (response.statusCode == 400) {
      debugPrint('error 400');  
    }
    // print(response);
  }

  verify() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': userId,
      'code': activeatedCodeTextEditingController.text,
      'command': 'verify'
    };
    var response =
        await DioService().postMethod(map, ApiUrlConstant.postRegister);

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
      // debugPrint('logined');
      routeWriteBottomSheet();
    }
  }

  routeWriteBottomSheet() {
    Get.bottomSheet(Container(
      height: Get.height / 2,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 228, 228, 228),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Assets.icons.robotIcon.path,
                  height: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "دانستنی‌های خود را با ما به اشتراک بگذارید",
                  style: TextStyle(fontSize: 18, fontFamily: 'yekan'),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text("""
یکی از عجایبی که در جهان به چشم می‌خورد تعداد موجودات زنده‌ای است که در حال زندگی کردن هستند.
و خدایی که روزی همه این موجودات را همواره فراهم کرده و می‌کند...
الحمدالله الرب العالمین
"""),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (() {
                  // debugPrint('write article');
                  Get.toNamed(NameRoute.routeManageArticle);
                  }),
                  child: Container(
                    color: const Color.fromARGB(255, 228, 228, 222),
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.icons.writer.path,
                          height: 35,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'مدیریت مقاله‌ها',
                          style: TextStyle(fontFamily: 'yekan'),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => debugPrint("record podcast"),
                  child: Container(
                    color: const Color.fromARGB(255, 228, 228, 222),
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.icons.podcast.path,
                          height: 35,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'مدیریت پادکست‌ها',
                          style: TextStyle(fontFamily: 'yekan'),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
