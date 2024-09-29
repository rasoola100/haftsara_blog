import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:haftsara_blog/components/const_strings.dart';
import 'package:haftsara_blog/controller/register_controller.dart';
import 'package:haftsara_blog/gen/assets.gen.dart';
import 'package:validators/validators.dart';

class RegisterIntro extends StatelessWidget {
   RegisterIntro({super.key});

  // RegisterController registerController = Get.put(RegisterController());
  var registerController = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.images.robotIcon.path,
              height: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: Conststrings.registerIntroText,
                    style: textTheme.headlineMedium)),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    // backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: Container(
                          height: screenSize.height / 2,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            // color: Colors.white
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "ایمیل خود را وارد کنید",
                                style: textTheme.headlineMedium,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: TextField(
                                  controller: registerController.emailTextEditingController,
                                  onChanged: (value) {
                                    log(
                                        "$value is Email = ${isEmail(value)}");
                                  },
                                  textAlign: TextAlign.end,
                                  decoration: const InputDecoration(
                                      labelText: "ایمیل شما",
                                      hintText: "yourEmail@gmail.com",
                                      hintStyle: TextStyle(fontSize: 14)),
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    registerController.regeiter();
                                    Navigator.pop(context);
                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom),
                                            child: Container(
                                              height: screenSize.height / 2,
                                              width: double.infinity,
                                              decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20))),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "کد فعالسازی را وارد کنید",
                                                    style: textTheme
                                                        .headlineMedium,
                                                  ),
                                                   Padding(
                                                    padding:
                                                        const EdgeInsets.all(20.0),
                                                    child: TextField(
                                                      controller: registerController.activeatedCodeTextEditingController,
                                                      onChanged: null,
                                                      textAlign: TextAlign.center,
                                                      decoration:
                                                          const InputDecoration(
                                                              label: Text(
                                                                  "کد فعالسازی"),
                                                              hintText:
                                                                  "- - - - - -",
                                                              hintStyle:
                                                                  TextStyle(
                                                                      fontSize:
                                                                          14)),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      registerController.verify();
                                                      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const CategoryScreen()));
                                                    }, 
                                                    child: Text("ثبت", style: textTheme.headlineMedium))
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  child: Text(
                                    "ادامه",
                                    style: textTheme.titleSmall,
                                  ))
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: Text(
                "بزن بریم",
                style: textTheme.titleSmall,
              ),
            )
          ],
        )),
      ),
    );
  }
}
