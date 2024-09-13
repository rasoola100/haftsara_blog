import 'package:get/get.dart';
import 'package:haftsara_blog/components/api_url_constant.dart';
import 'package:haftsara_blog/model/article_info_model.dart';
import 'package:haftsara_blog/services/dio_service.dart';

class SingleArticleController extends GetxController {
  RxInt id = RxInt(0);
  // Rx<ArticleInfoModel> articleInfoModel = Rx(ArticleInfoModel());
  Rx<ArticleInfoModel> articleInfoModel=ArticleInfoModel().obs;
  RxBool loading = false.obs;

  getArticleInfo() async {
    articleInfoModel=ArticleInfoModel().obs;
    loading.value = true;
    var userId = '';
    var response = await DioService().getMethod(
        "${ApiUrlConstant.baseUrl}article/get.php?command=info&id=$id&user_id=$userId");
    if (response.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromJson(response.data);

      loading.value = false;
    }
  }
}
