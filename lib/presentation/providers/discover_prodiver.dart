
import 'package:flutter/material.dart';

import 'package:tiktok_clone/domain/domain.dart';

class DiscoverProvider extends ChangeNotifier {

  final VideoPostRepository videosRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({
    required this.videosRepository
  });

  Future<void> loadNextPage() async {

    final List<VideoPost> newVideos = await videosRepository.getTrendingVideosByPage(1);
    videos.addAll(newVideos);

    initialLoading = false;
    notifyListeners();
  }

}
