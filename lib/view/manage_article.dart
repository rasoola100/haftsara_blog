import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:haftsara_blog/components/const_strings.dart';
import 'package:haftsara_blog/components/my_component.dart';
import 'package:haftsara_blog/controller/manage_article_controller.dart';
import 'package:haftsara_blog/gen/assets.gen.dart';

// ignore: must_be_immutable
class ManageArticle extends StatelessWidget {
  ManageArticle({super.key});

  var manageArticleController = Get.find<ManageArticleController>();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: appBar('مدیریت مقاله‌ها'),
        body: Obx(
          () => manageArticleController.loading.value
              ? const Center(child: CircularProgressIndicator())
              : manageArticleController.articleList.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount:
                                manageArticleController.articleList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () async {
                                  // TODO route to single manage
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: Get.width / 4,
                                        width: Get.width / 4,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: CachedNetworkImage(
                                            imageUrl: manageArticleController
                                                .articleList[index].image!,
                                            imageBuilder:
                                                (context, imageProvider) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
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
                                            errorWidget:
                                                ((context, url, error) {
                                              return const Icon(
                                                Icons.error,
                                                color: Colors.red,
                                              );
                                            }),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: Get.width - Get.width / 3,
                                            child: Text(
                                              manageArticleController
                                                  .articleList[index].title!,
                                              style: textTheme.headlineMedium,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            width: Get.width - Get.width / 3,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  manageArticleController
                                                      .articleList[index]
                                                      .author!,
                                                  style: textTheme.labelMedium,
                                                ),
                                                Text(
                                                    "${manageArticleController.articleList[index].view!} بازدید",
                                                    style:
                                                        textTheme.labelMedium)
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
                    )
                  : articleEmptyState(textTheme),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
          child: ElevatedButton(
              style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(Size(Get.width / 5, 50))
                  ),
              onPressed: () {},
              child: Text(
                'افزودن مقاله جدید',
                style: textTheme.displaySmall,
              )),
        ),
      ),
    );
  }

  Widget articleEmptyState(TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            SvgPicture.asset(
              Assets.images.robotIcon.path,
              height: 100,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              Conststrings.manageArticleText,
              style: textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}
