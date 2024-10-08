import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:social_media/core/network/firestore/core/firestore_base_model.dart';

abstract class NetworkFailure extends Equatable {}

class OfflineFailure extends NetworkFailure {
  final String message;

  OfflineFailure({
    required this.message,
  });

  @override
  List<Object?> get props => [];
}

class FireStoreMethodFailure extends NetworkFailure {
  final FireStoreBaseModel? model;

  FireStoreMethodFailure({
    this.model,
  });

  @override
  List<Object?> get props => [model];
}

class ApiServerFailure extends NetworkFailure {
  final Response? response;

  ApiServerFailure({
    this.response,
  });

  @override
  List<Object?> get props => [response];
}

class EmptyApiCacheFailure extends NetworkFailure {
  @override
  List<Object?> get props => [];
}

class EmptyFireStoreCacheFailure extends NetworkFailure {
  @override
  List<Object?> get props => [];
}


