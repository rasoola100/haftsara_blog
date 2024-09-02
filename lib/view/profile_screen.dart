import 'package:flutter/material.dart';
import 'package:haftsara_blog/blog_divider.dart';
import 'package:haftsara_blog/consts/const_colors.dart';
import 'package:haftsara_blog/gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.screenSize,
    required this.textTheme,
  });

  final Size screenSize;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image(
                image: Assets.images.avatar.provider(),
                width: 100,
              )),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                Assets.icons.pen.provider(),
                color: ConstColors.primaryColor,
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                'ویرایش تصویر پروفایل',
                style: textTheme.headlineMedium,
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'رسول امیری',
            style: textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'haftsara@info.com',
            style: textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 25,
          ),
          const BlogDivider(),
          InkWell(
              splashColor: Colors.white,
              onTap: () {},
              child: SizedBox(
                  height: 40,
                  child: Center(
                      child: Text(
                    'مقالات مورد علاقه من',
                    style: textTheme.headlineMedium,
                  )))),
          const BlogDivider(),
          InkWell(
              splashColor: Colors.white,
              onTap: () {},
              child: SizedBox(
                  height: 40,
                  child: Center(
                      child: Text(
                    'پادکست‌های مورد علاقه من',
                    style: textTheme.headlineMedium,
                  )))),
          const BlogDivider(),
          InkWell(
              splashColor: Colors.white,
              onTap: () {},
              child: SizedBox(
                  height: 40,
                  child: Center(
                      child: Text(
                    'خروج از حساب کاربری',
                    style: textTheme.headlineMedium,
                  )))),
                  const SizedBox(height: 100,),
        ],
      ),
    );
  }
}
