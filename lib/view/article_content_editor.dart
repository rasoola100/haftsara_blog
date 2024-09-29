import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haftsara_blog/components/my_component.dart';
import 'package:haftsara_blog/controller/manage_article_controller.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class ArticleContentEditor extends StatelessWidget {
  ArticleContentEditor({super.key});
  final HtmlEditorController controller = HtmlEditorController();
  var manageArticleController = Get.put(ManageArticleController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.clearFocus,
      child: Scaffold(
        appBar: appBar('نوشتن / ویرایش مقاله'),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HtmlEditor(
                controller: controller,
                htmlEditorOptions: HtmlEditorOptions(
                  hint: "متن خود را اینجا بنویسید...",
                  shouldEnsureVisible: true,
                  initialText: manageArticleController
                      .articleInfoModel.value.content ??= "",
                ),
                callbacks: Callbacks(
                  onChangeContent: (p0) {
                    manageArticleController.articleInfoModel.value.content = p0;
                    log(manageArticleController.articleInfoModel.value.content.toString());
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
