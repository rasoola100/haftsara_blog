import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:haftsara_blog/consts/const_colors.dart';
import 'package:haftsara_blog/view/home_screen.dart';
import 'package:haftsara_blog/view/register_intro.dart';
import 'package:haftsara_blog/view/splash_screen.dart';
import 'package:flutter/services.dart';

// void main() => runApp(const Haftsara());
void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ConstColors.primaryColor,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: ConstColors.primaryColor,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(const Haftsara());
}

class Haftsara extends StatelessWidget {
  const Haftsara({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('fa'),
      ],
      theme: ThemeData(
        fontFamily: 'bNazanin',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            height: 1.6,
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
            borderRadius: BorderRadius.circular(15)
          )
        ),
      ),
      home: const SplashScreen(),
      // home: const HomeScreen(),
      // home: const RegisterIntro(),
    );
  }
}
