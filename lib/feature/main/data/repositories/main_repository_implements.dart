import 'package:dartz/dartz.dart';
import 'package:social_media/core/helper/hive_hepler.dart';
import 'package:social_media/core/network/error/network_failures.dart';
import '../../../../core/network/connector.dart';
import '../../../../core/resource/app_key.dart';
import '../../domain/entities/response/home_posts_response_entity.dart';
import '../../domain/entities/response/home_story_response_entity.dart';
import '../../domain/repositories/api_main_repository.dart';
import '../../domain/repositories/fire_store_main_repository.dart';
import '../datasources/remot/api_main_remote.dart';
import '../datasources/remot/fire_store_main_remote.dart';

class MainRepositoryImplements
    implements ApiMainRepository, FireStoreMainRepository {
  final FireStoreMainRemote fireStoreMainRemote;
  final ApiMainRemote apiMainRemote;

  MainRepositoryImplements({
    required this.fireStoreMainRemote,
    required this.apiMainRemote,
  });

  @override
  Future<Either<NetworkFailure, HomePostsResponseEntity>> getHomePosts() async {
    return Connector<HomePostsResponseEntity>().connect(
      remote: () async {
        final result = await fireStoreMainRemote.getHomePosts();
        return Right(result);
      },
      cache: () async {
        final result = HiveHelper.getHomePosts(
            boxKey: AppKey.homeBox, saveKey: AppKey.homePosts);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<NetworkFailure, HomeStoryResponseEntity>> getHomeStory() async {
    return Connector<HomeStoryResponseEntity>().connect(
      remote: () async {
        final result = await fireStoreMainRemote.getHomeStory();
        return Right(result);
      },
      cache: () async {
        final result = HiveHelper.getHomeStories(
            boxKey: AppKey.homeBox, saveKey: AppKey.homeStories);
        return Right(result);
      },
    );
  }
}
