import 'package:dartz/dartz.dart';
import '../helper/network_helper.dart';
import 'error/network_exception.dart';
import 'error/network_failures.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */


class Connector<T> {
  Future<Either<NetworkFailure, T>> connect(
      {required Future<Right<NetworkFailure, T>> Function() remote,
      Future<Right<NetworkFailure, T>> Function()? cache}) async {

    final CheckConnectionModel checkConnectionModel =
        await NetworkHelper.checkInternetConnection();
    if (checkConnectionModel.isConnected) {
      try {
        return await remote();
      } on ApiServerException catch (error){
        return Left(ApiServerFailure(response: error.response));
      }on FireStoreMethodException catch (error) {
        return Left(FireStoreMethodFailure(model: error.model));
      }

    }
    else {
      if (cache == null) {
        return Left(OfflineFailure(message: checkConnectionModel.message));
      } else {
        try {
          return await cache();
        } on EmptyApiCacheException {
          return Left(EmptyApiCacheFailure());
        }
        on EmptyFireStoreCacheException {
          return Left(EmptyFireStoreCacheFailure());
        }
      }
    }
  }
}
