
import 'package:flutter/material.dart';

import 'package:tiktok_clone/domain/domain.dart';
import 'package:tiktok_clone/infraestructure/models/local_video_model.dart';
import 'package:tiktok_clone/shared/shared.dart';

class DiscoverProvider extends ChangeNotifier {

  // TODO: Repository, DataSource

  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {

    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts.map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity()).toList();
    videos.addAll(newVideos);

    initialLoading = false;
    notifyListeners();
  }

}
