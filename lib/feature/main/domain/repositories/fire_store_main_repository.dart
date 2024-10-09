import 'package:dartz/dartz.dart';
import '../../../../core/network/error/network_failures.dart';
import '../entities/response/home_posts_response_entity.dart';
import '../entities/response/home_story_response_entity.dart';

abstract class FireStoreMainRepository {
  Future<Either<NetworkFailure, HomePostsResponseEntity>> getHomePosts();
  Future<Either<NetworkFailure, HomeStoryResponseEntity>> getHomeStory();
}
