
import 'package:tiktok_clone/domain/domain.dart';

abstract class VideoPostDataSource {

  Future<List<VideoPost>> getTrendingVideosByPage( int page );

  Future<List<VideoPost>> getFavoriteVideosByUser( String userId );

}
