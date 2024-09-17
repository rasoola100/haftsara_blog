import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:haftsara_blog/components/const_colors.dart';
import 'package:haftsara_blog/my_http_override.dart';
import 'package:haftsara_blog/view/article_list_screen.dart';
import 'package:haftsara_blog/view/home_screen.dart';
import 'package:haftsara_blog/view/register_intro.dart';
import 'package:haftsara_blog/view/single_screen.dart';
import 'package:haftsara_blog/view/splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

// void main() => runApp(const Haftsara());
void main() async {
HttpOverrides.global = MyHttpOverride();


  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ConstColors.primaryColor,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: ConstColors.primaryColor,
      systemNavigationBarIconBrightness: Brightness.dark));

  await GetStorage.init();
  runApp(const Haftsara());
}

class Haftsara extends StatelessWidget {
  const Haftsara({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('fa'),

      theme: ThemeData(
        fontFamily: 'bNazanin',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            height: 2,
            fontSize: 18,
            color: Colors.black,
          ),
          titleMedium: TextStyle(
              fontFamily: 'yekan',
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.black),
          titleSmall: TextStyle(
              fontFamily: 'yekan',
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.white),
          titleLarge: TextStyle(
              fontFamily: 'yekan',
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white),
          headlineMedium: TextStyle(
              fontFamily: 'yekan',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: ConstColors.primaryColor),
          headlineSmall: TextStyle(
              fontFamily: 'yekan',
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black),
          labelMedium: TextStyle(
              fontFamily: 'bNazanin',
              fontSize: 16,
              color: Color.fromARGB(255, 90, 89, 89)),
          labelSmall: TextStyle(
              fontFamily: 'bNazanin',
              fontSize: 14,
              color: Color.fromARGB(255, 90, 89, 89)),
          displaySmall: TextStyle(
              fontFamily: 'yekan',
              fontSize: 13,
              fontWeight: FontWeight.w300,
              color: Colors.white),
          bodySmall: TextStyle(
              fontFamily: 'yekan',
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 29, 29, 29)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith((status) {
              if (status.contains(WidgetState.pressed)) {
                return ConstColors.primaryColor;
              } else {
                return ConstColors.secondaryColor;
              }
            }),
            shape: WidgetStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100))),
          ),
        ),
        // TextField style
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 1.1),
                borderRadius: BorderRadius.circular(15))),
      ),
      home: const SplashScreen(),
      // home: const HomeScreen(),
      // home: ArticleListScreen(title: 'مقالات جدید',),
    );
  }
}
