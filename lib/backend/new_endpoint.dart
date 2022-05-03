import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:news_app/model/news_model.dart';

class NewsEndPoint {
  static const source = 'source';
  static const nameSource = 'name';
  static const author = 'author';
  static const description = 'description';
  static const url = 'url';
  static const urlToImage = 'urlToImage';
  static const content = 'content';

  static Future<List<NewsModel>> getNews(String category , String country) async {
    List<NewsModel> news = [];
    try {
      final response = await Dio().get(
        "https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=deaa5165bf2441438c3807fdcef28446",
        options: Options(headers: {
          'Content-Type': 'application/json',
        })
      );
      if (response.statusCode == 200) {
        for(Map<String ,dynamic> json in response.data["articles"] ){
          news.add(NewsModel.fromMap(json));
        }
      } else {
        print("failed");
      }
    } catch (e) {
      print(e.toString());
    }
    return news;
  }
}
