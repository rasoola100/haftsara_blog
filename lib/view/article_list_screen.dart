import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haftsara_blog/components/my_component.dart';
import 'package:haftsara_blog/controller/article_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:haftsara_blog/controller/single_article_controller.dart';
import 'package:haftsara_blog/view/single_screen.dart';

class ArticleListScreen extends StatelessWidget {
  String title;
  ArticleListScreen({required this.title,super.key});

  ArticleController articleController = Get.put(ArticleController());
  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    // double screenSize = MediaQuery.sizeOf(context).width;
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: appBar(title),
        
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: articleController.articleList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // singleArticleController.id.value =
                        //     int.parse(articleController.articleList[index].id.toString());
                       singleArticleController.getArticleInfo(articleController.articleList[index].id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            SizedBox(
                              height: screenSize.width / 4,
                              width: screenSize.width / 4,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: CachedNetworkImage(
                                  imageUrl: articleController
                                      .articleList[index].image!,
                                  imageBuilder: (context, imageProvider) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15)),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 4,
                                                spreadRadius: 0.5)
                                          ]),
                                    );
                                  },
                                  placeholder: ((context, urr) {
                                    return const CircularProgressIndicator(
                                      color: Colors.orange,
                                    );
                                  }),
                                  errorWidget: ((context, url, error) {
                                    return const Icon(
                                      Icons.error,
                                      color: Colors.red,
                                    );
                                  }),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width:
                                      screenSize.width - screenSize.width / 3,
                                  child: Text(
                                    articleController.articleList[index].title!,
                                    style: textTheme.headlineMedium,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width:
                                      screenSize.width - screenSize.width / 3,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        articleController
                                            .articleList[index].author!,
                                        style: textTheme.labelMedium,
                                      ),
                                      Text(
                                          "${articleController.articleList[index].view!} بازدید",
                                          style: textTheme.labelMedium)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
