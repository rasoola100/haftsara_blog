import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haftsara_blog/components/const_colors.dart';
import 'package:haftsara_blog/components/const_strings.dart';
import 'package:haftsara_blog/gen/assets.gen.dart';
import 'package:haftsara_blog/model/fake_data_map.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                SvgPicture.asset(
                  Assets.images.robotIcon.path,
                  height: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  Conststrings.welcomeAndSelectCategory,
                  style: textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 1, 20, 25),
                  child: TextField(
                    onChanged: null,
                    decoration:
                        InputDecoration(labelText: "نام و نام خانوادگی"),
                  ),
                ),

                Text(
                  "دسته‌های مورد علاقه خود را انتخاب کنید",
                  style: textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                // const SizedBox(height: 12,),
                SizedBox(
                  height: 150,
                  // width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: blogCategoryList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 3,
                          mainAxisSpacing: 3,
                          childAspectRatio: 0.4,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                if (!selectedCategoryList
                                    .contains(blogCategoryList[index])) {
                                  selectedCategoryList.add(blogCategoryList[index]);
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  gradient: const LinearGradient(
                                      colors: ConstColors.tagsGradientColor,
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 6, right: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ImageIcon(
                                      Assets.icons.hashtag.provider(),
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      blogCategoryList[index].title,
                                      style: textTheme.titleLarge,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SvgPicture.asset(
                    Assets.images.arrowBottom.path,
                    height: 60,
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: selectedCategoryList.length,
                        scrollDirection: Axis.horizontal,
                        physics: const ClampingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 3,
                          mainAxisSpacing: 3,
                          childAspectRatio: 0.4,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              gradient: const LinearGradient(
                                  colors: ConstColors.selectedTagsGradientColor,
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 6, right: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    selectedCategoryList[index].title,
                                    style: textTheme.titleLarge,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedCategoryList.removeAt(index);
                                      });
                                    },
                                      child: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 27,
                                  ))
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
