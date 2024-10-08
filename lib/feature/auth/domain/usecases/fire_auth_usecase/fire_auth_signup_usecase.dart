import 'package:dartz/dartz.dart';
import 'package:social_media/core/network/error/network_failures.dart';
import 'package:social_media/feature/auth/domain/entities/request/login_request_entity.dart';
import 'package:social_media/feature/auth/domain/entities/request/signup_request_entity.dart';
import 'package:social_media/feature/auth/domain/repositories/fire_auth_repository.dart';

class FireAuthSignUpUsecase {
  final FireAuthRepository repository;

  FireAuthSignUpUsecase({
    required this.repository,
  });

  Future<Either<NetworkFailure, Unit>> call(
      {required SignupRequestEntity entity}) async {
    return await repository.signUp(signupRequestEntity: entity);
  }
}
