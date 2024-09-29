import 'package:get/get.dart';
import 'package:haftsara_blog/controller/article_controller.dart';
import 'package:haftsara_blog/controller/manage_article_controller.dart';
import 'package:haftsara_blog/controller/register_controller.dart';
import 'package:haftsara_blog/controller/single_article_controller.dart';

class ArticleBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ArticleController(), permanent: false);

    Get.lazyPut(() => SingleArticleController());
  }
}

class ArticleManagerBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(ManageArticleController());
    Get.lazyPut(() => ManageArticleController());
  }
  
}

  class RegisterBinding extends Bindings {
    @override  
    void dependencies() {
      Get.put(RegisterController());
    }
  }
