import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:haftsara_blog/components/const_colors.dart';
import 'package:haftsara_blog/controller/file_controller.dart';
import 'package:haftsara_blog/controller/manage_article_controller.dart';
import 'package:haftsara_blog/gen/assets.gen.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:haftsara_blog/services/pick_file.dart';
import 'package:haftsara_blog/view/article_content_editor.dart';

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
                          : Image.file(File(fileController.file.value.path!), fit: BoxFit.cover,),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
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
                        Text(
                          'برای نوشتن تگ‌های مقاله کلیک کنید',
                          style: textTheme.headlineMedium,
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 10),
                  child: HtmlWidget(
                    '''
                          <p style="text-align: justify">
                            ${manageArticleController.articleInfoModel.value.content ??= ''}
                          </p>
                          ''',
                    textStyle: textTheme.bodyMedium,
                    enableCaching: true,
                    onLoadingBuilder: (context, element, loadingProgress) {
                      return const CircularProgressIndicator();
                    },
                  ),
                ),
                // const Padding(
                //   padding: EdgeInsets.all(8),
                //   child: Divider(),
                // ),

                // category list-----------------------------------------
                // SizedBox(
                //   height: 50,
                //   child: Padding(
                //     padding: const EdgeInsets.only(right: 8.0),
                //     child: ListView.builder(
                //       itemCount:
                //           manageArticleController.categoryList.length,
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (context, index) {
                //         return InkWell(
                //           onTap: () async {
                //             var catId = manageArticleController
                //                 .categoryList[index].id!;
                //             await Get.find<ArticleController>()
                //                 .getArticleListByCatId(catId);
                //             // await articleController.getArticleListByCatId(catId);
                //             Get.to(() => ArticleListScreen(
                //                 title: manageArticleController
                //                     .categoryList[index].title!));
                //           },
                //           child: Padding(
                //             padding: const EdgeInsets.only(left: 8.0),
                //             child: Container(
                //               decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(15),
                //                   color: const Color.fromARGB(
                //                       255, 104, 104, 104)),
                //               child: Center(
                //                   child: Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text(
                //                   manageArticleController
                //                       .categoryList[index].title!,
                //                   style: textTheme.titleSmall,
                //                 ),
                //               )),
                //             ),
                //           ),
                //         );
                //       },
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
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
          hintStyle: TextStyle(color: Color.fromARGB(255, 196, 195, 195), fontSize: 14),
          
        ),
        style: const TextStyle(color: Colors.white),
      ),
      confirm: ElevatedButton(
        onPressed: () {
          manageArticleController.updateTitle();
          Get.back();
        }, 
        child: const Text("ثبت", style: TextStyle(color: Colors.white),)),
      cancel: ElevatedButton(
        onPressed: () => Get.back(), 
         child: const Text("انصراف", style: TextStyle(color: Colors.white),)),
    );
   }


}
