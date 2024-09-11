import 'package:get/get.dart';
import 'package:haftsara_blog/components/api_url_constant.dart';
import 'package:haftsara_blog/model/article_model.dart';
import 'package:haftsara_blog/model/category_model.dart';
import 'package:haftsara_blog/model/podcast_model.dart';
import 'package:haftsara_blog/model/poster_model.dart';
import 'package:haftsara_blog/services/dio_service.dart';

class HomeScreenController extends GetxController {
  RxList<ArticleModel> topArticleList = RxList();
  RxList<PodcastModel> topPodcastList = RxList();
  RxList<CategoryModel> categoryList = RxList();
  Rx<PosterModel> poster = Rx(PosterModel());
  RxBool loading = false.obs;
  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }
  getHomeItems() async {
    loading.value = true;
    var response = await DioService().getMethod(ApiUrlConstant.getHomeItems);
    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topArticleList.add(ArticleModel.fromJson(element));
      });

      response.data['top_podcasts'].forEach((element) {
        topPodcastList.add(PodcastModel.fromJson(element));
      });

      response.data['categories'].forEach((element) {
        categoryList.add(CategoryModel.fromJson(element));
      });

      poster.value = PosterModel.fromJson(response.data['poster']);

      loading.value = false;
    }
  }
}
