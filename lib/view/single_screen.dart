import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:haftsara_blog/components/const_colors.dart';
import 'package:haftsara_blog/gen/assets.gen.dart';
import 'package:get/get.dart';

class SingleScreen extends StatelessWidget {
  const SingleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: 'imageurl',
                    imageBuilder: (context, imageProvider) {
                      return Container(
                       width: screenSize.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
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
            ],
          ),
        ),
      ),
    );
  }
}
