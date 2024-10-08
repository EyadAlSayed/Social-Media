import 'package:equatable/equatable.dart';
import 'package:social_media/feature/main/domain/entities/response/home_response_entity.dart';

import '../../../../../core/network/firestore/core/firestore_base_model.dart';
import '../../../../../core/resource/app_enum.dart';

class FireStoreHomeState extends Equatable {
  final HomeResponseEntity entity;
  final CubitStatus status;
  final String error;

  const FireStoreHomeState({
    required this.error,
    required this.entity,
    required this.status,
  });

  factory FireStoreHomeState.initial() {
    return FireStoreHomeState(
        error: '', entity: HomeResponseEntity(), status: CubitStatus.initial);
  }

  @override
  bool get stringify => true;

  FireStoreHomeState copyWith(
      {String? error, HomeResponseEntity? entity, CubitStatus? status}) {
    return FireStoreHomeState(
      error: error ?? this.error,
      entity: entity ?? this.entity,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props {
    return [status, error, entity];
  }
}
