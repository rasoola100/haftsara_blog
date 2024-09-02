import 'package:flutter/material.dart';
import 'package:haftsara_blog/consts/const_colors.dart';
import 'package:haftsara_blog/consts/const_strings.dart';
import 'package:haftsara_blog/gen/assets.gen.dart';
import 'package:haftsara_blog/model/fake_data_map.dart';

class HomeMainBodyScreen extends StatelessWidget {
  const HomeMainBodyScreen({
    super.key,
    required this.screenSize,
    required this.textTheme,
  });

  final Size screenSize;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
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
            HomePoster(screenSize: screenSize, textTheme: textTheme),
            const SizedBox(
              height: 15,
            ),
            // category list #taglist
            CategoryList(textTheme: textTheme),
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
                Text(
                  Conststrings.viewHotPosts,
                  style: textTheme.headlineMedium,
                )
              ],
            ),
            HotPostList(screenSize: screenSize, textTheme: textTheme),
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
            HotPodcastList(screenSize: screenSize, textTheme: textTheme),
            const SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}

class HotPodcastList extends StatelessWidget {
  const HotPodcastList({
    super.key,
    required this.screenSize,
    required this.textTheme,
  });

  final Size screenSize;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height / 2.7,
      child: ListView.builder(
          itemCount: podcastList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: screenSize.height / 4.5,
                    width: screenSize.width / 3.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(2, 3),
                              blurRadius: 2),
                        ],
                        image: DecorationImage(
                            image: AssetImage(
                                podcastList[index].podcastImg),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  SizedBox(
                      width: screenSize.width / 3.5,
                      child: Text(
                        podcastList[index].title,
                        style: textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
            );
          }),
    );
  }
}

class HotPostList extends StatelessWidget {
  const HotPostList({
    super.key,
    required this.screenSize,
    required this.textTheme,
  });

  final Size screenSize;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height / 2.7,
      child: ListView.builder(
          itemCount: postList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Stack(children: [
                    Container(
                      height: screenSize.height / 4.5,
                      width: screenSize.width / 3.5,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(14)),
                          image: DecorationImage(
                              image: AssetImage(
                                  postList[index].imageUrl),
                              fit: BoxFit.cover),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2,
                                offset: Offset(2, 3))
                          ]),
                      foregroundDecoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(14)),
                          gradient: LinearGradient(
                              colors: ConstColors
                                  .hotPostImageCoverGradientColor,
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter)),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              postList[index].writer,
                              style: textTheme.titleSmall,
                            ),
                            Row(
                              children: [
                                Text(
                                  postList[index].view.toString(),
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
                        postList[index].content,
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ))
                ],
              ),
            );
          }),
    );
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            return Padding(
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
                        categoryList[index].title,
                        style: textTheme.titleSmall,
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class HomePoster extends StatelessWidget {
  const HomePoster({
    super.key,
    required this.screenSize,
    required this.textTheme,
  });

  final Size screenSize;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.infinity,
        height: screenSize.height / 4,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(homePosterMap['imageAssets']),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                  offset: Offset(2, 4)),
            ]),
        foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: const LinearGradient(
              colors: ConstColors.homePosterGradientColor,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
      ),
      Positioned(
        left: 0,
        right: 0,
        bottom: 10,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    homePosterMap['writer'] +
                        " - " +
                        homePosterMap['date'],
                    style: textTheme.titleSmall,
                  ),
                  Text(
                    "بازدید  ${homePosterMap['view']}",
                    style: textTheme.titleSmall,
                  ),
                ],
              ),
            ),
            Center(
                child: Text(
              homePosterMap['title'],
              style: textTheme.titleLarge,
            ))
          ],
        ),
      ),
    ]);
  }
}
