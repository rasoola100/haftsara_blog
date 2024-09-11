import 'package:haftsara_blog/components/api_url_constant.dart';

class PosterModel {
  String? id;
  String? title;
  String? image;

  PosterModel({this.id, this.title, this.image});

  PosterModel.fromJson(Map<String, dynamic> posterModelJson) {
    id = posterModelJson['id'];
    title = posterModelJson['title'];
    image = ApiUrlConstant.hostDlUrl + posterModelJson['image'];
  }
}
