
import 'package:dartz/dartz.dart';
import 'package:social_media/feature/main/domain/entities/response/home_response_entity.dart';

import '../../../../core/network/error/network_failures.dart';


abstract class FireStoreMainRepository {

  Future<Either<NetworkFailure, HomeResponseEntity>> getHome(
     );


}
