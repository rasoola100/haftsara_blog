import 'package:get/get.dart';
import 'package:haftsara_blog/components/api_url_constant.dart';
import 'package:haftsara_blog/model/article_info_model.dart';
import 'package:haftsara_blog/services/dio_service.dart';

class SingleArticleController extends GetxController {
  RxInt id = RxInt(0);
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
  getArticleInfo();
    
  }

  getArticleInfo() async {
    loading.value = true;
    var user_id = '';
    var response = await DioService().getMethod(
        "${ApiUrlConstant.baseUrl}article/get.php?command=info&id=id&user_id=user_id");
    if (response.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromJson(response.data);

      loading.value = false;
    }
  }
}
