import 'package:flutter/cupertino.dart';

class NewsModel {
  final String pubDate;
  final String title;
  final String description;
  final String link;
  final Image picture;
  final enclosure;

  NewsModel(
      {this.pubDate,
      this.title,
      this.description,
      this.link,
      this.picture,
      this.enclosure});
}
