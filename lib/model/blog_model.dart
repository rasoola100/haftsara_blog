
class BlogCategoryModel {
  String title;
  BlogCategoryModel({required this.title});
}



class BlogPodcastModel {
  int id;
  String title;
  String description;
  String podcastImg;
  String speaker;
  String speakerImg;
  int view;
  String date;
 
  BlogPodcastModel({
    required this.id,
    required this.title,
    required this.description,
    required this.podcastImg,
    required this.speaker,
    required this.speakerImg,
    required this.view,
    required this.date,
  });

}

