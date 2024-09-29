import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haftsara_blog/components/const_colors.dart';
import 'package:haftsara_blog/components/const_strings.dart';
import 'package:haftsara_blog/controller/article_controller.dart';
import 'package:haftsara_blog/controller/home_screen_controller.dart';
import 'package:haftsara_blog/controller/single_article_controller.dart';
import 'package:haftsara_blog/gen/assets.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:haftsara_blog/view/article_list_screen.dart';

class HomeMainBodyScreen extends StatelessWidget {
   HomeMainBodyScreen({
    super.key,
    required this.screenSize,
    required this.textTheme,
  });

  final Size screenSize;
  final TextTheme textTheme;

   HomeScreenController homeScreenController = Get.put(HomeScreenController());
  SingleArticleController singleArticleController = Get.put(SingleArticleController());
  ArticleController articleController = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
   
    // CachedNetworkImage.logLevel = CacheManagerLogLevel.debug;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            // poster
            // HomePoster(screenSize: widget.screenSize, textTheme: widget.textTheme),
            homePoster(),
            
            const SizedBox(
              height: 15,
            ),
            // category list #taglist
            // CategoryList(textTheme: widget.textTheme),
            blogCategoryList(),
            const SizedBox(
              height: 25,
            ),
            // hot posts title
            Row(
              children: [
                ImageIcon(
                  Assets.icons.pen.provider(),
                  color: ConstColors.primaryColor,
                  size: 20,
                ),
                const SizedBox(
                  width: 6,
                ),
                GestureDetector(
                  onTap: () => Get.to(() => ArticleListScreen(title: 'مقالات جدید')),
                  child: Text(
                    Conststrings.viewHotPosts,
                    style: textTheme.headlineMedium,
                  ),
                )
              ],
            ),
            // HotPostList(screenSize: screenSize, textTheme: textTheme),
            topArticleVisited(),
            const SizedBox(
              height: 2,
            ),
            // hot podcast title
            Row(
              children: [
                ImageIcon(
                  Assets.icons.podcast.provider(),
                  color: ConstColors.primaryColor,
                  size: 20,
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  Conststrings.viewHotPodcast,
                  style: textTheme.headlineMedium,
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            // HotPodcastList(
            //     screenSize: widget.screenSize, textTheme: widget.textTheme),
            topPodcast(),
            const SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }

  Widget topArticleVisited() {
    return SizedBox(
      height: screenSize.height / 2.7,
      child: Obx(
        () => ListView.builder(
            itemCount: homeScreenController.topArticleList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    var id = homeScreenController.topArticleList[index].id;
                    // Get.find<SingleArticleController>().getArticleInfo(id);
                    singleArticleController.getArticleInfo(id);
                  },
                  // TODO دکمه بالا به صورت زیر از NameRoute استفاده کند
                  //  onTap: () async{
                  //   var id = homeScreenController.topArticleList[index].id;
                  //   // Get.find<SingleArticleController>().getArticleInfo(id);
                   
                  //   await singleArticleController.getArticleInfo(id);
                  //   Get.toNamed(NameRoute.routeSingleArticle);
                  
                  child: Column(
                    children: [
                      Stack(children: [
                        SizedBox(
                          height: screenSize.height / 4.5,
                          width: screenSize.width / 3.5,
                          child: CachedNetworkImage(
                            imageUrl:
                                homeScreenController.topArticleList[index].image!,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(2, 3),
                                      blurRadius: 2),
                                ],
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                            ),
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.image_not_supported_sharp,
                              size: 50,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  homeScreenController
                                      .topArticleList[index].author!,
                                  style: textTheme.titleSmall,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      homeScreenController
                                          .topArticleList[index].view
                                          .toString(),
                                      style: textTheme.titleSmall,
                                    ),
                                    const Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.white,
                                      size: 14,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ]),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                          width: screenSize.width / 3.5,
                          child: Text(
                            homeScreenController.topArticleList[index].title!,
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ))
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  } 
 // end topArticleVisited method widget
  Widget topPodcast() {
    return SizedBox(
      height: screenSize.height / 2.7,
      child: Obx(
        () => ListView.builder(
            itemCount: homeScreenController.topPodcastList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenSize.height / 4.5,
                      width: screenSize.width / 3.5,
                      child: CachedNetworkImage(
                        imageUrl:
                            homeScreenController.topPodcastList[index].poster!,
                        // 'https://haftsara.ir/admin/img/posts/25536140d71e65ed09bc798da87beafc.jpeg',
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(2, 3),
                                    blurRadius: 2),
                              ],
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          );
                        }, // imageBuilder
                        placeholder: (context, url) {
                          return const SpinKitFadingCircle(
                            size: 50,
                            color: ConstColors.primaryColor,
                          );
                        }, // placeholder
                        errorWidget: (context, url, error) => const Icon(
                          Icons.image_not_supported_outlined,
                          size: 60,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    SizedBox(
                        width: screenSize.width / 3.5,
                        child: Text(
                          homeScreenController.topPodcastList[index].title!,
                          style: textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        )),
                  ],
                ),
              );
            }),
      ),
    );
  } 
 // end topPodcast method widget
  Widget blogCategoryList() {
     return SizedBox(
      height: 50,
      child: Obx(
        () => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: homeScreenController.categoryList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  var catId = homeScreenController.categoryList[index].id!;
                  var catName = homeScreenController.categoryList[index].title!;
                  // Get.find<ArticleController>().getArticleListByCatId(catId); کار نکرد
                  articleController.getArticleListByCatId(catId);
                  Get.to(() => ArticleListScreen(title: catName));
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          gradient: const LinearGradient(
                              colors: ConstColors.tagsGradientColor,
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft)),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            ImageIcon(
                              Assets.icons.hashtag.provider(),
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              homeScreenController.categoryList[index].title!,
                              style: textTheme.titleSmall,
                            )
                          ],
                        ),
                      ),
                    ),
                  
                ),
              );
            }),
      ),
    );
  }

  Widget homePoster() {
    return Obx(
       () => homeScreenController.loading.value == false ? Stack(children: [
        Container(
          width: double.infinity,
          height: screenSize.height / 4,
         
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: const LinearGradient(
                colors: ConstColors.homePosterGradientColor,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: CachedNetworkImage(
          imageUrl: homeScreenController.poster.value.image!,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error ) => const Icon(Icons.image_not_supported_rounded),
         ),
        ),
        Positioned(
          left: 0, right: 0, bottom: 10,
          child: Center(
              child: Text(
            homeScreenController.poster.value.title!,
            style: textTheme.titleLarge,
          )),
        ),
      ]): const CircularProgressIndicator()
    );
  }
}



