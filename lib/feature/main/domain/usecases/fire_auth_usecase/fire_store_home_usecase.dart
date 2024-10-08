import 'package:dartz/dartz.dart';
import 'package:social_media/core/network/error/network_failures.dart';
import 'package:social_media/feature/auth/domain/entities/request/forget_password_request_entity.dart';
import 'package:social_media/feature/main/domain/entities/response/home_response_entity.dart';
import 'package:social_media/feature/main/domain/repositories/fire_store_main_repository.dart';

class FireStoreHomeUsecase {
  final FireStoreMainRepository repository;

  FireStoreHomeUsecase({
    required this.repository,
  });

  Future<Either<NetworkFailure, HomeResponseEntity>> call() async {
    return await repository.getHome();
  }
}
