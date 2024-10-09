import 'package:dartz/dartz.dart';
import 'package:social_media/core/network/error/network_failures.dart';
import 'package:social_media/feature/main/domain/repositories/fire_store_main_repository.dart';

import '../../entities/response/home_posts_response_entity.dart';

class FireStoreHomePostsUsecase {
  final FireStoreMainRepository repository;

  FireStoreHomePostsUsecase({
    required this.repository,
  });

  Future<Either<NetworkFailure, HomePostsResponseEntity>> call() async {
    return await repository.getHomePosts();
  }
}
