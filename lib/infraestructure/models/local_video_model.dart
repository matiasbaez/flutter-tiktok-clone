import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:tiktok_clone/domain/domain.dart';

class LocalVideoModel {

  final String name;
  final String url;
  final int likes;
  final int views;

  LocalVideoModel({
    required this.name,
    required this.url,
    this.likes = 0,
    this.views = 0,
  });

  factory LocalVideoModel.fromRawJson(String str) => LocalVideoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocalVideoModel.fromJson(Map<String, dynamic> json) => LocalVideoModel(
    url: json["url"] ?? 'No video name',
    name: json["name"] ?? '',
    likes: json["likes"] ?? 0,
    views: json["views"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "name": name,
    "likes": likes,
    "views": views,
  };

  VideoPost toVideoPostEntity() => VideoPost(
    caption: name,
    url: url,
    likes: likes,
    views: views
  );

}
