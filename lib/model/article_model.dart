import 'package:haftsara_blog/components/api_url_constant.dart';

class ArticleModel {
  String? id;
  String? title;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  // String? isFavorite;
  String? createdAt;

  ArticleModel({
    required this.id,
    required this.title,
    required this.image,
    required this.catId,
    required this.catName,
    required this.author,
    required this.view,
    required this.status,
    // this.isFavorite,
    required this.createdAt,
  });

  ArticleModel.fromJson(Map<String, dynamic> articleModelJosn) {
    id = articleModelJosn['id'];
    title = articleModelJosn['title'];
    image = ApiUrlConstant.hostDlUrl + articleModelJosn['image'];
    catId = articleModelJosn['cat_id'];
    catName = articleModelJosn['cat_name'];
    author = articleModelJosn['author'];
    view = articleModelJosn['view'];
    status = articleModelJosn['status'];
    createdAt = articleModelJosn['created_at'];
  }
}
