import 'package:dartz/dartz.dart';
import 'package:social_media/core/network/error/network_failures.dart';
import 'package:social_media/feature/auth/domain/entities/request/forget_password_request_entity.dart';
import 'package:social_media/feature/auth/domain/entities/request/login_request_entity.dart';
import 'package:social_media/feature/auth/domain/entities/request/signup_request_entity.dart';
import 'package:social_media/feature/auth/domain/repositories/fire_auth_repository.dart';
import '../../../../core/network/connector.dart';
import '../../domain/repositories/api_auth_repository.dart';
import '../datasources/remot/api_auth_remote.dart';
import '../datasources/remot/fire_auth_remote.dart';

class AuthRepositoryImplements implements ApiAuthRepository, FireAuthRepository {
  final FireAuthRemote fireAuthRemote;
  final ApiAuthRemote apiAuthRemote;

  AuthRepositoryImplements({
    required this.fireAuthRemote,
    required this.apiAuthRemote,
  });

  @override
  Future<Either<NetworkFailure, Unit>> forgetPassword(
      {required ForgetPasswordRequestEntity
          forgetPasswordRequestEntity}) async {
    return Connector<Unit>().connect(
      remote: () async {
        final result = await fireAuthRemote.forgetPassword(
            forgetPasswordRequestEntity: forgetPasswordRequestEntity);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<NetworkFailure, Unit>> login(
      {required LoginRequestEntity loginRequestEntity}) {
    return Connector<Unit>().connect(
      remote: () async {
        final result =
            await fireAuthRemote.login(loginRequestEntity: loginRequestEntity);
        return Right(result);
      },
    );
  }



  @override
  Future<Either<NetworkFailure, Unit>> signUp(
      {required SignupRequestEntity signupRequestEntity}) {
    return Connector<Unit>().connect(
      remote: () async {
        final result = await fireAuthRemote.signUp(
            signupRequestEntity: signupRequestEntity);
        return Right(result);
      },
    );
  }
}
