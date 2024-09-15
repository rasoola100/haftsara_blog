import 'package:flutter/material.dart';
import 'package:haftsara_blog/components/const_colors.dart';
import 'package:haftsara_blog/components/text_style.dart';
import 'package:get/get.dart';

PreferredSize appBar(String title) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: Center(child: Text(title, style: appBarTextStyle,)),
              ),
            ],
            leading: Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: Container(
                height: 40,width: 40,
                decoration: BoxDecoration(
                  color: ConstColors.primaryColor.withAlpha(100),
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.keyboard_arrow_right)),
              ),
            ),
          ),
        ),
      );
  }