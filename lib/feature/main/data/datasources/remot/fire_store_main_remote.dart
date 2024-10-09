import 'package:social_media/core/helper/hive_hepler.dart';
import 'package:social_media/core/network/error/network_exception.dart';
import 'package:social_media/core/network/firestore/core/firestore_status_code.dart';
import '../../../../../core/network/firestore/core/firestore_base_model.dart';
import '../../../../../core/network/firestore/core/firestore_method.dart';
import '../../../../../core/resource/app_key.dart';
import '../../../domain/entities/response/home_posts_response_entity.dart';
import '../../../domain/entities/response/home_story_response_entity.dart';

abstract class FireStoreMainRemote {
  Future<HomePostsResponseEntity> getHomePosts();

  Future<HomeStoryResponseEntity> getHomeStory();
}

class FireStoreMainRemoteImplement extends FireStoreMainRemote {
  @override
  Future<HomePostsResponseEntity> getHomePosts() async {
    FireStoreBaseModel model = await FireStoreGetMethod.getHomePosts();
    if (FireStoreStatusCode.successStatus().contains(model.code)) {
      HomePostsResponseEntity responseEntity =
          HomePostsResponseEntity.fromJson(model.data);
      HiveHelper.saveHomePosts(
          boxKey: AppKey.homeBox,
          saveKey: AppKey.homePosts,
          entity: responseEntity);
      return responseEntity;
    } else {
      throw FireStoreMethodException(model: model);
    }
  }

  @override
  Future<HomeStoryResponseEntity> getHomeStory() async {
    FireStoreBaseModel model = await FireStoreGetMethod.getStoryPosts();

    if (FireStoreStatusCode.successStatus().contains(model.code)) {
      HomeStoryResponseEntity responseEntity =
          HomeStoryResponseEntity.fromJson(model.data);
      HiveHelper.saveHomeStories(
          boxKey: AppKey.homeBox,
          saveKey: AppKey.homeStories,
          entity: responseEntity);
      return responseEntity;
    } else {
      throw FireStoreMethodException(model: model);
    }
  }
}
