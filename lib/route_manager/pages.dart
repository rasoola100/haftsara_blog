import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:haftsara_blog/route_manager/binding.dart';
import 'package:haftsara_blog/route_manager/name_route.dart';
import 'package:haftsara_blog/view/home_screen.dart';
import 'package:haftsara_blog/view/manage_article.dart';
import 'package:haftsara_blog/view/podcast/single_podcast.dart';
import 'package:haftsara_blog/view/single_manage_Article_screen.dart';
import 'package:haftsara_blog/view/single_screen.dart';
import 'package:haftsara_blog/view/splash_screen.dart';

class Pages {
  Pages._();

  static List<GetPage<dynamic>> pages = [
        GetPage(
            name: NameRoute.initialRoute,
            page: () => const SplashScreen(),
            ), 
        GetPage(
            name: NameRoute.routeHomeScreen,
            page: () => const HomeScreen(),
            binding: RegisterBinding()),
        GetPage(
            name: NameRoute.routeSingleArticle,
            page: () => SingleScreen(),
            binding: ArticleBinding()),
        GetPage(
            name: NameRoute.routeManageArticle,
            page: () => ManageArticle(),
            binding: ArticleManagerBinding()),
        GetPage(
            name: NameRoute.routeSingleManageArticle,
            page: () => SingleManageArticleScreen(),
            binding: ArticleManagerBinding()),
        GetPage(
            name: NameRoute.routeSinglePodcast, 
            page: () => SinglePodcast()),
      ];

}