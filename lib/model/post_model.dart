class PostModel {
  int id;
  String title;
  String content;
  String imageUrl;
  String writer;
  String writerImgUrl;
  String date;
  int view;
  PostModel({
    required this.id,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.writer,
    required this.writerImgUrl,
    required this.date,
    required this.view,
  });
}