import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:haftsara_blog/components/const_strings.dart';
import 'package:haftsara_blog/components/my_component.dart';
import 'package:haftsara_blog/gen/assets.gen.dart';

class ManageArticle extends StatelessWidget {
  const ManageArticle({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: appBar('مدیریت مقاله‌ها'),
        body: articleEmptyState(textTheme),
      ),
    );
  }

  Widget articleEmptyState(TextTheme textTheme) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              SvgPicture.asset(
                Assets.images.robotIcon.path,
                height: 100,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                Conststrings.manageArticleText,
                style: textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 70,),
              Positioned(
                left: 0,
                right: 0,
                top: Get.height - 50,
                child: ElevatedButton(
                  onPressed: () {}, 
                  child: Text('افزودن مقاله جدید', style: textTheme.displaySmall,)),
              )
            ],
          ),
        ),
      );
  }
}
