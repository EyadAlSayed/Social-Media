import 'package:flutter/cupertino.dart';

import 'network_failures.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/8/2024.
 */

class ErrorEntity {
  String errorMessage;
  int statusCode;
  int errorCode;

  ErrorEntity({
    this.errorMessage = '',
    this.errorCode = 0,
    this.statusCode = 0,
  });
}

abstract class NetworkErrorHandler {
  static Future<ErrorEntity> mapFailure({
    BuildContext? buildContext,
    required NetworkFailure failure,
  }) {
    ErrorEntity errorEntity = ErrorEntity();
    switch (failure.runtimeType) {
      case const (FireStoreMethodFailure):
        {
          return handleFireStoreMethodFailure(
              buildContext: buildContext,
              failure: failure as FireStoreMethodFailure,
              errorEntity: errorEntity);
        }
      case const (ApiServerFailure):
        {
          return handleApiServerFailure(
              buildContext: buildContext,
              failure: failure as ApiServerFailure,
              errorEntity: errorEntity);
        }
      case const (EmptyApiCacheFailure):
        {
          return handleEmptyApiCacheFailure(
              failure: failure as EmptyApiCacheFailure,
              errorEntity: errorEntity);
        }
      case const (OfflineFailure):
        {
          return handleOfflineFailure(
              buildContext: buildContext,
              failure: failure as OfflineFailure,
              errorEntity: errorEntity);
        }
      default:
        {
          errorEntity.errorMessage = "Some thing went wrong";
          return Future.value(errorEntity);
        }
    }
  }

  static Future<ErrorEntity> handleFireStoreMethodFailure(
      {BuildContext? buildContext,
      required FireStoreMethodFailure failure,
      required ErrorEntity errorEntity}) {
    errorEntity.errorMessage = failure.model?.error ?? "";
    errorEntity.statusCode = failure.model?.code ?? -1;
    // TODO handle server error method if needed ex: handle logout functionality when session is expired

    return Future.value(errorEntity);
  }

  static Future<ErrorEntity> handleApiServerFailure(
      {BuildContext? buildContext,
      required ApiServerFailure failure,
      required ErrorEntity errorEntity}) {
    // TODO handle server error method if needed ex: handle logout functionality when session is expired
    return Future.value(errorEntity);
  }

  static Future<ErrorEntity> handleEmptyApiCacheFailure(
      {required EmptyApiCacheFailure failure,
      required ErrorEntity errorEntity}) {
    errorEntity.errorMessage = "There is no cached data";
    return Future.value(errorEntity);
  }

  static Future<ErrorEntity> handleOfflineFailure(
      {BuildContext? buildContext,
      required OfflineFailure failure,
      required ErrorEntity errorEntity}) {
    errorEntity.statusCode = 0;
    errorEntity.errorCode = 0;
    errorEntity.errorMessage = failure.message;
    // TODO handle no internet connection method if needed ex: handle redirect screen to no internet screen
    return Future.value(errorEntity);
  }
}
