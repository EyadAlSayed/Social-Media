import 'package:dartz/dartz.dart';
import 'package:social_media/core/network/error/network_failures.dart';
import 'package:social_media/feature/main/domain/repositories/fire_store_main_repository.dart';

import '../../entities/response/home_story_response_entity.dart';

class FireStoreHomeStoryUsecase {
  final FireStoreMainRepository repository;

  FireStoreHomeStoryUsecase({
    required this.repository,
  });

  Future<Either<NetworkFailure, HomeStoryResponseEntity>> call() async {
    return await repository.getHomeStory();
  }
}
