import 'package:dartz/dartz.dart';
import 'package:social_media/core/network/error/network_failures.dart';
import 'package:social_media/feature/auth/domain/entities/request/forget_password_request_entity.dart';
import 'package:social_media/feature/auth/domain/entities/request/login_request_entity.dart';
import 'package:social_media/feature/auth/domain/repositories/fire_auth_repository.dart';

class FireAuthForgetPasswordUsecase {
  final FireAuthRepository repository;

  FireAuthForgetPasswordUsecase({
    required this.repository,
  });

  Future<Either<NetworkFailure, Unit>> call(
      {required ForgetPasswordRequestEntity entity}) async {
    return await repository.forgetPassword(forgetPasswordRequestEntity: entity);
  }
}
