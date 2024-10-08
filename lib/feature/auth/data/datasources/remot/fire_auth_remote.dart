import 'package:dartz/dartz.dart';
import 'package:social_media/core/network/error/network_exception.dart';
import 'package:social_media/core/network/firestore/core/firestore_method.dart';
import 'package:social_media/core/network/firestore/core/firestore_status_code.dart';
import 'package:social_media/feature/auth/domain/entities/request/forget_password_request_entity.dart';
import 'package:social_media/feature/auth/domain/entities/request/login_request_entity.dart';
import 'package:social_media/feature/auth/domain/entities/request/logout_request_entity.dart';
import 'package:social_media/feature/auth/domain/entities/request/signup_request_entity.dart';

import '../../../../../core/network/firestore/core/firestore_base_model.dart';

abstract class FireAuthRemote {
  Future<Unit> login(
      {required LoginRequestEntity loginRequestEntity});

  Future<Unit> signUp(
      {required SignupRequestEntity signupRequestEntity});

  Future<Unit> forgetPassword(
      {required ForgetPasswordRequestEntity forgetPasswordRequestEntity});

  Future<Unit> logout(
      {required LogoutRequestEntity logoutRequestEntity});
}

class FireAuthRemoteImplement extends FireAuthRemote {
  @override
  Future<Unit> login(
      {required LoginRequestEntity loginRequestEntity}) async {
    // FireStoreBaseModel model =
    //     await FireStoreAddMethod.login(body: loginRequestEntity.toJson());

    FireStoreBaseModel model = FireStoreBaseModel();
    if (FireStoreStatusCode.successStatus().contains(model.code)) {
      return Future.value(unit);
    } else {
      throw FireStoreMethodException(model: model);
    }
  }

  @override
  Future<Unit> forgetPassword(
      {required ForgetPasswordRequestEntity
          forgetPasswordRequestEntity}) async {
    // FireStoreBaseModel model = await FireStoreAddMethod.login(
    //     body: forgetPasswordRequestEntity.toJson());
    FireStoreBaseModel model = FireStoreBaseModel();

    if (FireStoreStatusCode.successStatus().contains(model.code)) {
      return Future.value(unit);
    } else {
      throw FireStoreMethodException(model: model);
    }
  }

  @override
  Future<Unit> logout(
      {required LogoutRequestEntity logoutRequestEntity}) async {
    // FireStoreBaseModel model =
    //     await FireStoreAddMethod.login(body: logoutRequestEntity.toJson());
    FireStoreBaseModel model = FireStoreBaseModel();

    if (FireStoreStatusCode.successStatus().contains(model.code)) {
      return Future.value(unit);
    } else {
      throw FireStoreMethodException(model: model);
    }
  }

  @override
  Future<Unit> signUp(
      {required SignupRequestEntity signupRequestEntity}) async {
    // FireStoreBaseModel model =
    //     await FireStoreAddMethod.login(body: signupRequestEntity.toJson());
    FireStoreBaseModel model = FireStoreBaseModel();

    if (FireStoreStatusCode.successStatus().contains(model.code)) {
      return Future.value(unit);
    } else {
      throw FireStoreMethodException(model: model);
    }
  }
}
