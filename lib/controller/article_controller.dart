import 'package:get/get.dart';
import 'package:haftsara_blog/components/api_url_constant.dart';
import 'package:haftsara_blog/model/article_model.dart';
import 'package:haftsara_blog/services/dio_service.dart';

class ArticleController extends GetxController{
  RxList<ArticleModel> articleList = RxList();
  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getList();
  }

  getList() async {
    loading.value = true;
    // TODO get userId from getStrorage and add to ApiUrlConstant.getArticleList
    var response = await DioService().getMethod(ApiUrlConstant.getArticleList);

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      loading.value = false;
    }

  }

}