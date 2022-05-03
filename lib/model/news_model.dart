import 'package:news_app/backend/new_endpoint.dart';

class NewsModel {
  String? nameSource, author, description, moreInformaion, urLImage, content;

  NewsModel({
    this.nameSource,
    this.author,
    this.description,
    this.moreInformaion,
    this.urLImage,
    this.content,
  });


  factory NewsModel.fromMap(Map<String , dynamic> json){
    return NewsModel(
      author: json[NewsEndPoint.author],
      nameSource: json[NewsEndPoint.source ][NewsEndPoint.nameSource],
      description: json[NewsEndPoint.description],
      content: json[NewsEndPoint.content],
      moreInformaion: json[NewsEndPoint.url],
      urLImage: json[NewsEndPoint.urlToImage],
    );
  }

  @override
  String toString() {
    return 'NewsModel{nameSource: $nameSource, author: $author, description: $description, moreInformaion: $moreInformaion, urLImage: $urLImage, contant: $content}';
  }
}
