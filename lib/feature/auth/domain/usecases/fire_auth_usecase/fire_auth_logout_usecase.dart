import 'package:dartz/dartz.dart';
import 'package:social_media/core/network/error/network_failures.dart';
import 'package:social_media/feature/auth/domain/entities/request/login_request_entity.dart';
import 'package:social_media/feature/auth/domain/entities/request/logout_request_entity.dart';
import 'package:social_media/feature/auth/domain/repositories/fire_auth_repository.dart';

class FireAuthLogOutUsecase {
  final FireAuthRepository repository;

  FireAuthLogOutUsecase({
    required this.repository,
  });

  Future<Either<NetworkFailure, Unit>> call(
      {required LogoutRequestEntity entity}) async {
    return await repository.logOut(logoutRequestEntity: entity);
  }
}
