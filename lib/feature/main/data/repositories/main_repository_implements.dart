import 'package:dartz/dartz.dart';
import 'package:social_media/core/network/error/network_failures.dart';
import 'package:social_media/feature/auth/domain/entities/request/forget_password_request_entity.dart';
import 'package:social_media/feature/auth/domain/entities/request/login_request_entity.dart';
import 'package:social_media/feature/auth/domain/entities/request/signup_request_entity.dart';
import 'package:social_media/feature/auth/domain/repositories/fire_auth_repository.dart';
import 'package:social_media/feature/main/domain/entities/response/home_response_entity.dart';
import '../../../../core/network/connector.dart';
import '../../domain/repositories/api_main_repository.dart';
import '../../domain/repositories/fire_store_main_repository.dart';
import '../datasources/remot/api_main_remote.dart';
import '../datasources/remot/fire_store_main_remote.dart';

class MainRepositoryImplements
    implements ApiMainRepository, FireStoreMainRepository {
  final FireStoreMainRemote fireStoreMainRemote;
  final ApiMainRemote apiMainRemote;

  MainRepositoryImplements({
    required this.fireStoreMainRemote,
    required this.apiMainRemote,
  });

  @override
  Future<Either<NetworkFailure, HomeResponseEntity>> getHome() async {
    return Connector<HomeResponseEntity>().connect(
      remote: () async {
        final result = await fireStoreMainRemote.getHome();
        return Right(result);
      },
    );
  }
}
