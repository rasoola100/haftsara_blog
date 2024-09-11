import 'package:flutter/material.dart';
import 'package:haftsara_blog/components/const_colors.dart';
import 'package:haftsara_blog/gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:haftsara_blog/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
   runHomePageAfterSplash(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: Assets.images.logo.provider(),
                width: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              const SpinKitDualRing(
                color: ConstColors.primaryColor,
                size: 50,
              )
            ],
          ),
        ),
      ),
    );
  }

  void runHomePageAfterSplash(context) {
    Future.delayed(const Duration(seconds: 3)).then((onValue) {
      if (context.mounted) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
      }
    });
  }
}
