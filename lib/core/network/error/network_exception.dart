import 'package:http/http.dart';
import 'package:social_media/core/network/firestore/core/firestore_base_model.dart';
/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */


class FireStoreMethodException implements Exception {
  FireStoreBaseModel? model;
  FireStoreMethodException({
    this.model,
  });
}
class ApiServerException implements Exception {
  Response? response;
  ApiServerException({
    this.response,
  });
}
class TimeOutException implements Exception {

}

class EmptyApiCacheException implements Exception {}
class EmptyFireStoreCacheException implements Exception {}

class OfflineApiException implements Exception {}
