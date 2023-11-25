
// import 'package:tiktok_clone/domain/repositories/repositories.dart';
// import 'package:tiktok_clone/domain/datasources/datasources.dart';
// import 'package:tiktok_clone/domain/entities/entities.dart';
import 'package:tiktok_clone/domain/domain.dart';

class VideoPostsRepositoryImpl extends VideoPostRepository {

  final VideoPostDataSource videosDataSource;

  VideoPostsRepositoryImpl({
    required this.videosDataSource
  });

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videosDataSource.getTrendingVideosByPage(page);
  }

}