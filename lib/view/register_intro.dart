import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haftsara_blog/consts/const_strings.dart';
import 'package:haftsara_blog/gen/assets.gen.dart';
import 'package:haftsara_blog/view/category_screen.dart';
import 'package:validators/validators.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({super.key});

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
              Assets.images.robotIcon,
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
                                  onChanged: (value) {
                                    print(
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
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.all(20.0),
                                                    child: TextField(
                                                      onChanged: null,
                                                      textAlign: TextAlign.center,
                                                      decoration:
                                                          InputDecoration(
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
                                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => CategoryScreen()));
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
