import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:haftsara_blog/components/const_colors.dart';
import 'package:haftsara_blog/controller/article_controller.dart';
import 'package:haftsara_blog/controller/file_controller.dart';
import 'package:haftsara_blog/controller/home_screen_controller.dart';
import 'package:haftsara_blog/controller/manage_article_controller.dart';
import 'package:haftsara_blog/gen/assets.gen.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:haftsara_blog/services/pick_file.dart';
import 'package:haftsara_blog/view/article_content_editor.dart';
import 'package:haftsara_blog/view/article_list_screen.dart';

// ignore: must_be_immutable
class SingleManageArticleScreen extends StatelessWidget {
  SingleManageArticleScreen({super.key});

  var manageArticleController = Get.find<ManageArticleController>();
  FileController fileController = Get.put(FileController());

  // @override
  @override
  Widget build(BuildContext context) {
    // var id = Get.arguments[0];
    var screenSize = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: Get.width,
                      height: Get.height / 3,
                      child: fileController.file.value.name == 'nothing'
                          ? CachedNetworkImage(
                              imageUrl: manageArticleController
                                  .articleInfoModel.value.image ??= '',
                              imageBuilder: (context, imageProvider) {
                                return Image(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                );
                              },
                              placeholder: (context, url) {
                                return const CircularProgressIndicator(
                                  color: ConstColors.primaryColor,
                                );
                              },
                              errorWidget: (context, url, error) {
                                return SizedBox(
                                  width: screenSize.width,
                                  child: Image(
                                    image: AssetImage(Assets.images.linux.path),
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            )
                          : Image.file(
                              File(fileController.file.value.path!),
                              fit: BoxFit.cover,
                            ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                          height: 60,
                          width: screenSize.width,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: ConstColors.appBarGradientColor,
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () => Get.back(),
                                child: const Icon(
                                  Icons.arrow_back,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: InkWell(
                          hoverColor: Colors.grey[400],
                          onTap: () {
                            pickFile();
                          },
                          child: Container(
                            width: Get.width / 3,
                            height: 35,
                            decoration: const BoxDecoration(
                              color: ConstColors.secondaryColor,
                              backgroundBlendMode: BlendMode.multiply,
                              // borderRadius: BorderRadius.only(
                              //     topLeft: Radius.circular(20),
                              //     topRight: Radius.circular(20))
                            ),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'انتخاب تصویر',
                                    style: textTheme.titleSmall,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            )),
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    getTitle();
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                    child: Row(
                      children: [
                        ImageIcon(
                          Assets.icons.pen.provider(),
                          size: 22,
                          color: ConstColors.primaryColor,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text(
                          'برای نوشتن عنوان مقاله کلیک کنید',
                          style: textTheme.headlineMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      manageArticleController.articleInfoModel.value.title ??=
                          "عنوان مقاله شما",
                      // manageArticleController.articleInfoModel.value.title != null
                      style: textTheme.bodyLarge,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                    child: Row(
                      children: [
                        ImageIcon(
                          Assets.icons.pen.provider(),
                          size: 22,
                          color: ConstColors.primaryColor,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        GestureDetector(
                          onTap: () => Get.to(() => ArticleContentEditor()),
                          child: Text(
                            'برای نوشتن محتوای مقاله کلیک کنید',
                            style: textTheme.headlineMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      manageArticleController.articleInfoModel.value.content ??=
                          "محتوای مقاله شما",
                      // manageArticleController.articleInfoModel.value.title != null
                      style: textTheme.bodyLarge,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    chooseCatsBottomSheet(textTheme);
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                    child: Row(
                      children: [
                        ImageIcon(
                          Assets.icons.pen.provider(),
                          size: 22,
                          color: ConstColors.primaryColor,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text(
                          'برای نوشتن تگ‌های مقاله کلیک کنید',
                          style: textTheme.headlineMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      manageArticleController.articleInfoModel.value.catName ??=
                          "دسته‌بندی مقاله انتخاب نشده است",
                      style: textTheme.bodyLarge,
                    ),
                  ),
                ),
               
        const SizedBox(height: 50,),
              ],
            ),
          ),
        ),
        bottomNavigationBar: 
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
          child: InkWell(
                    onTap: () async{
                      await manageArticleController.storeArticle();
                     
                    },
                    borderRadius: BorderRadius.circular(50),
                   splashColor: Colors.greenAccent,
                    child: Container(
                      
                      height: 50,
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          boxShadow: [
                            BoxShadow(blurRadius: 1, offset: Offset(1, 1))
                          ]),
                      child: Center(
                          child: Text(
                            manageArticleController.loading.value ? 
                            'لطفا صبر کنید...'
                            : 'ارسال مطلب' ,
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      )),
                    ),
                  ),
        ),
      ),
    );
  }

  Widget cats(TextTheme textTheme) {
    var homeScreenController = Get.find<HomeScreenController>();
    return SizedBox(
      height: Get.height / 1.9,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: GridView.builder(
          itemCount: homeScreenController.categoryList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                manageArticleController.articleInfoModel.update((fn) {
                  fn!.catId = homeScreenController.categoryList[index].id;
                  fn.catName = homeScreenController.categoryList[index].title;
                });

                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ConstColors.primaryColor),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        homeScreenController.categoryList[index].title!,
                        style: textTheme.titleSmall,
                      ),
                    ),
                  )),
                ),
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 4, mainAxisSpacing: 4),
        ),
      ),
    );
  }

  chooseCatsBottomSheet(TextTheme textTheme) {
    Get.bottomSheet(
      backgroundColor: Colors.white,
      Container(
        height: Get.height / 1.5,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text('انتخاب دسته‌بندی'),
              const SizedBox(
                height: 20,
              ),
              cats(textTheme),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
      persistent: true,
    );
  }

  getTitle() {
    Get.defaultDialog(
      title: 'عنوان مقاله',
      titleStyle: const TextStyle(color: Colors.white),
      backgroundColor: ConstColors.primaryColor,
      radius: 7,
      content: TextField(
        controller: manageArticleController.titleTextEditingController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          hintText: 'اینجا بنویسید',
          hintStyle: TextStyle(
              color: Color.fromARGB(255, 196, 195, 195), fontSize: 14),
        ),
        style: const TextStyle(color: Colors.white),
      ),
      confirm: ElevatedButton(
          onPressed: () {
            manageArticleController.updateTitle();
            Get.back();
          },
          child: const Text(
            "ثبت",
            style: TextStyle(color: Colors.white),
          )),
      cancel: ElevatedButton(
          onPressed: () => Get.back(),
          child: const Text(
            "انصراف",
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
