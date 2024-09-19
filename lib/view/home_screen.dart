import 'package:flutter/material.dart';
import 'package:haftsara_blog/components/api_url_constant.dart';
import 'package:haftsara_blog/components/blog_component.dart';
import 'package:haftsara_blog/components/const_colors.dart';
import 'package:get/get.dart';
import 'package:haftsara_blog/components/const_strings.dart';
import 'package:haftsara_blog/controller/home_screen_controller.dart';
import 'package:haftsara_blog/controller/register_controller.dart';
import 'package:haftsara_blog/gen/assets.gen.dart';
import 'package:haftsara_blog/services/dio_service.dart';
import 'package:haftsara_blog/view/home_main_body_screen.dart';
import 'package:haftsara_blog/view/profile_screen.dart';
import 'package:haftsara_blog/view/register_intro.dart';
import 'package:haftsara_blog/view/write_post.dart';
import 'package:share_plus/share_plus.dart';
// import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  // int selectedPageIndex = 0;
  RxInt selectedPageIndex = 0.obs;

  // HomeScreenController homeScreenController = Get.put(HomeScreenController());

  // RegisterController registerController =
  //     Get.put(RegisterController(), permanent: false);
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Image.asset(
              Assets.images.logo.path,
              scale: 0.5,
              height: 40,
            )),
            ListTile(
              onTap: null,
              title: Text(
                "پروفایل کاربری",
                style: textTheme.headlineMedium,
              ),
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              onTap: null,
              title: Text(
                "درباره ما",
                style: textTheme.headlineMedium,
              ),
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              onTap: () async {
                await Share.share(Conststrings.shareText);
              },
              title: Text(
                "اشتراک‌گذاری بلاگ",
                style: textTheme.headlineMedium,
              ),
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              onTap: () {
                blogLauncherUrl(Conststrings.blogGighubUrl);
              },
              title: Text(
                "بلاگ در گیت‌هاب",
                style: textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: // top menu
            Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                _key.currentState?.openDrawer();
              },
              child: const Icon(
                Icons.menu,
                size: 25,
              ),
            ),
            Image(
              image: Assets.images.logo.provider(),
              height: screenSize.width / 14,
            ),
            const Icon(
              Icons.search,
              size: 25,
            ),
          ],
        ),
      ),
      body: Stack(children: [
        Positioned.fill(
            child: Obx(() => IndexedStack(
                  index: selectedPageIndex.value,
                  children: [
                    HomeMainBodyScreen(
                        screenSize: screenSize, textTheme: textTheme),
                    WritePost(screenSize: screenSize, textTheme: textTheme),
                    ProfileScreen(screenSize: screenSize, textTheme: textTheme),
                  ],
                ))),

        // bottom navigation
        BottomNavigation(
          screenSize: screenSize,
          changeScreen: (int value) {
            selectedPageIndex.value = value;
          },
        ),
      ]),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.screenSize,
    required this.changeScreen,
  });

  final Size screenSize;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 7,
      child: Container(
        height: screenSize.height / 10,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: ConstColors.bottomNavOverlayGradientColor,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Container(
            height: screenSize.height / 12,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: const LinearGradient(
                  colors: ConstColors.bottomNavGradientColor,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    changeScreen(0);
                  },
                  icon: ImageIcon(
                    Assets.icons.homeIcon.provider(),
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      // TODO check login user
                      // registerController.checkLogin();
                      Get.find<RegisterController>().checkLogin();
                      // Get.to(() => RegisterIntro());
                    },
                    icon: ImageIcon(
                      Assets.icons.writer.provider(),
                      color: Colors.white,
                      size: 28,
                    )),
                IconButton(
                    onPressed: () => changeScreen(2),
                    icon: ImageIcon(
                      Assets.icons.user.provider(),
                      color: Colors.white,
                      size: 30,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
