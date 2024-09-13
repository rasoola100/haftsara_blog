import 'package:haftsara_blog/components/api_url_constant.dart';

class ArticleInfoModel {
  String? id;
  String? title;
  String? content;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;
  bool? isFavorite;

  // ArticleInfoModel({
  //    this.id,
  //    this.title,
  //    this.content,
  //    this.image,
  //    this.catId,
  //    this.catName,
  //    this.author,
  //    this.view,
  //    this.status,
  //    this.createdAt,
  //    this.isFavorite,
  // });
  ArticleInfoModel();

  ArticleInfoModel.fromJson(Map<String, dynamic> element) {
    var info = element['info'];
    id = info['id'] ?? '';
    //  id = element['info']['id'];
    title = info['title'] ?? '';
    content = info['content'] ?? '';
    image = ApiUrlConstant.hostDlUrl + info['image'];
    catId = info['cat_id'] ?? '';
    catName = info['cat_name'] ?? '';
    author = info['author'] ?? '';
    view = info['view'] ?? '';
    status = info['status'] ?? '';
    createdAt = info['created_at'] ?? '';
    isFavorite = element['isFavorite'] ?? '';
  }
}



