import 'package:get/get.dart';
import 'package:haftsara_blog/components/api_url_constant.dart';
import 'package:haftsara_blog/model/article_info_model.dart';
import 'package:haftsara_blog/model/article_model.dart';
import 'package:haftsara_blog/model/category_model.dart';
import 'package:haftsara_blog/services/dio_service.dart';
import 'package:haftsara_blog/view/single_screen.dart';

class SingleArticleController extends GetxController {
  RxInt id = RxInt(0);
  // Rx<ArticleInfoModel> articleInfoModel = Rx(ArticleInfoModel());
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;
  RxBool loading = false.obs;
  RxList<CategoryModel> categoryList = RxList();
  RxList<ArticleModel> relatedArticleList = RxList();

  getArticleInfo(var id) async {
    articleInfoModel = ArticleInfoModel().obs;
    loading.value = true;
    var userId = '';
    var response = await DioService().getMethod(
        "${ApiUrlConstant.baseUrl}article/get.php?command=info&id=$id&user_id=$userId");
    if (response.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromJson(response.data);

      categoryList.clear();
      response.data['tags'].forEach((element) {
        categoryList.add(CategoryModel.fromJson(element));
      });

      relatedArticleList.clear();
      response.data['related'].forEach((element) {
        relatedArticleList.add(ArticleModel.fromJson(element));
      });

      loading.value = false;
    }
    Get.to(() => SingleScreen());

  }// end of getArticleInfo method
}
