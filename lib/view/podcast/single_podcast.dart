import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haftsara_blog/components/const_colors.dart';
import 'package:haftsara_blog/gen/assets.gen.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SinglePodcast extends StatelessWidget {
  const SinglePodcast({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              'https://cdn.bama.ir/uploads/BamaImages/News/a7edbd4d-9b76-4164-94eb-b173c729f3fa/article_638292480713269881_thumb_960_542.jpg?width=984',
                          imageBuilder: (context, imageProvider) {
                            return Image(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            );
                          },
                          placeholder: (context, url) {
                            return const CircularProgressIndicator();
                          },
                          errorWidget: (context, url, error) {
                            return const Icon(
                              Icons.image_not_supported,
                              color: Colors.grey,
                              size: 50,
                            );
                          },
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                              height: 60,
                              width: Get.width,
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
                                  const Expanded(
                                    child: SizedBox(),
                                  ),
                                  const Icon(
                                    Icons.share,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'عنوان پادکست',
                          maxLines: 2,
                          style: textTheme.headlineMedium,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                Assets.images.avatar.path,
                                fit: BoxFit.cover,
                                height: 50,
                              )),
                          const SizedBox(
                            width: 14,
                          ),
                          Text(
                            'رسول امیری',
                            style: textTheme.labelMedium,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: (context, url) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ImageIcon(
                                      Assets.icons.podcast.provider(),
                                      size: 25,
                                      color: ConstColors.primaryColor,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'پادکست شماره یک ',
                                      style: textTheme.headlineMedium,
                                    )
                                  ],
                                ),
                                Text(
                                  '33:33',
                                  style: textTheme.headlineMedium,
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                right: 15,
                left: 15,
                bottom: 7,
                child: Container(
                  height: Get.height / 6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                          colors: ConstColors.bottomNavGradientColor,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 18, 8, 10),
                      child: LinearPercentIndicator(
                        percent: 0.4,
                        backgroundColor: Colors.white,
                        progressColor: Colors.orange,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        Icon(Icons.skip_next, color: Colors.white, size: 33,), 
                        Icon(Icons.play_circle, color: Colors.white, size: 40,), 
                        Icon(Icons.skip_previous, color: Colors.white, size: 33,), 
                        SizedBox(),
                        Icon(Icons.repeat, color: Colors.white, size: 33,), 
                      ],),
                    )
                  ],),
                ))
          ],
        ),
      ),
    );
  }
}
