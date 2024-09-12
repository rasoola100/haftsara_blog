import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:haftsara_blog/components/const_colors.dart';
import 'package:haftsara_blog/gen/assets.gen.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:haftsara_blog/controller/single_article.dart';

class SingleScreen extends StatelessWidget {
   SingleScreen({super.key});

  SingleArticleController singleArticleController = Get.put(SingleArticleController());

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
                    CachedNetworkImage(
                      imageUrl: singleArticleController.articleInfoModel.value.image!,
                      imageBuilder: (context, imageProvider) {
                        return Image(image: imageProvider, fit: BoxFit.cover,);
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
                          child: const Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.arrow_back,
                                size: 30,
                                color: Colors.white,
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              Icon(
                                Icons.bookmark_border_outlined,
                                size: 30,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.share,
                                size: 30,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(
                    singleArticleController.articleInfoModel.value.title!,
                    maxLines: 2,
                    style: textTheme.headlineMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                        Assets.images.avatar.path,
                        height: 50,
                      )),
                      const SizedBox(width: 15,),
                      Text(singleArticleController.articleInfoModel.value.author!, style: textTheme.headlineSmall,),
                      const SizedBox(width: 17,),
                      Text(singleArticleController.articleInfoModel.value.createdAt!, style: textTheme.labelMedium,),
                    ],
                  ),
                ),
                HtmlWidget(
                  singleArticleController.articleInfoModel.value.content!,
                 
                  textStyle: textTheme.labelMedium,
                  enableCaching: true,
                  onLoadingBuilder: (context, element, loadingProgress) {
                    return const CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
