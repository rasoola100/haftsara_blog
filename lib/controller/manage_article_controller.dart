import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:haftsara_blog/components/api_url_constant.dart';
import 'package:haftsara_blog/components/storage_const.dart';
import 'package:haftsara_blog/model/article_info_model.dart';
import 'package:haftsara_blog/model/article_model.dart';
import 'package:haftsara_blog/model/category_model.dart';
import 'package:haftsara_blog/services/dio_service.dart';

class ManageArticleController extends GetxController {
  // RxList<ArticleModel> articleList = RxList();
  RxList<ArticleModel> articleList = RxList.empty();
  RxList<CategoryModel> categoryList = RxList();
  RxBool loading = false.obs;
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;
  TextEditingController titleTextEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getManageArticle();
  }

  getManageArticle() async {
    loading.value = true;
    var response = await DioService().getMethod(
        '${ApiUrlConstant.publishedByMe}1');
        //GetStorage().read(StorageConst.userId)
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      loading.value = false;
    }
  }

  updateTitle() {
   articleInfoModel.update((fn) {
    fn?.title = titleTextEditingController.text;
   });
  //  titleTextEditingController.text = '';
  }

}

