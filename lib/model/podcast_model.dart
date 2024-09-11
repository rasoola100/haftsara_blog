
import 'package:haftsara_blog/components/api_url_constant.dart';

class PodcastModel {
  String? id;
  String? title;
  String? poster;
  String? publisher;
  String? view;
  String? createdAt;
 
  PodcastModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.publisher,
    required this.view,
    required this.createdAt,
  });

  PodcastModel.fromJson(Map<String, dynamic> podcastModelJson) {
    id = podcastModelJson['id'];
    title = podcastModelJson['title'];
    poster = ApiUrlConstant.hostDlUrl + podcastModelJson['poster'];
    publisher = podcastModelJson['publisher'];
    view = podcastModelJson['view'];
    createdAt = podcastModelJson['created_at'];
  }
}