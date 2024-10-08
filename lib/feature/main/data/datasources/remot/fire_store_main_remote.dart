import 'package:dartz/dartz.dart';
import 'package:social_media/core/network/error/network_exception.dart';
import 'package:social_media/core/network/firestore/core/firestore_method.dart';
import 'package:social_media/core/network/firestore/core/firestore_status_code.dart';
import 'package:social_media/feature/auth/domain/entities/request/forget_password_request_entity.dart';
import 'package:social_media/feature/auth/domain/entities/request/login_request_entity.dart';
import 'package:social_media/feature/auth/domain/entities/request/logout_request_entity.dart';
import 'package:social_media/feature/auth/domain/entities/request/signup_request_entity.dart';
import 'package:social_media/feature/main/domain/entities/response/home_response_entity.dart';

import '../../../../../core/network/firestore/core/firestore_base_model.dart';

abstract class FireStoreMainRemote {
  Future<HomeResponseEntity> getHome();

}

class FireStoreMainRemoteImplement extends FireStoreMainRemote {
  @override
  Future<HomeResponseEntity> getHome() async {
    throw FireStoreMethodException(model: FireStoreBaseModel());
  }

}
