
import 'package:dartz/dartz.dart';
import 'package:social_media/feature/auth/domain/entities/request/forget_password_request_entity.dart';
import 'package:social_media/feature/auth/domain/entities/request/login_request_entity.dart';
import 'package:social_media/feature/auth/domain/entities/request/signup_request_entity.dart';

import '../../../../core/network/error/network_failures.dart';
import '../entities/request/logout_request_entity.dart';


abstract class FireAuthRepository {

  Future<Either<NetworkFailure, Unit>> login(
      {required LoginRequestEntity loginRequestEntity});


  Future<Either<NetworkFailure, Unit>> signUp(
      {required SignupRequestEntity signupRequestEntity});


  Future<Either<NetworkFailure, Unit>> forgetPassword(
      {required ForgetPasswordRequestEntity forgetPasswordRequestEntity});



  Future<Either<NetworkFailure, Unit>> logOut({required LogoutRequestEntity logoutRequestEntity});
}
