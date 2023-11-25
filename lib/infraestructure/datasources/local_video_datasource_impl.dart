
import 'package:tiktok_clone/domain/domain.dart';

import 'package:tiktok_clone/infraestructure/infraestructure.dart';
import 'package:tiktok_clone/shared/data/local_video_post.dart';

class LocalVideoDataSource implements VideoPostDataSource {

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts.map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity()).toList();

    return newVideos;
  }

}