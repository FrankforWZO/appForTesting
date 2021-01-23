//import 'package:flutter/cupertino.dart';

class CalameoModel {
  final String name, subscriptioniD, description, date, posterUrl, viewURL;

  CalameoModel(
      {this.name,
      this.subscriptioniD,
      this.description,
      this.date,
      this.posterUrl,
      this.viewURL});

  factory CalameoModel.fromJson(Map<String, dynamic> json) {
    return new CalameoModel(
      name: json['Name'].toString(),
      subscriptioniD: json['ID'].toString(),
      description: json['Description'].toString(),
      date: json['Date'].toString(),
      posterUrl: json['PictureUrl'].toString(),
      viewURL: json['ViewUrl'].toString(),
    );
  }
}
