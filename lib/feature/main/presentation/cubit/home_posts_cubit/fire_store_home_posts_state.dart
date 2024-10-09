import 'package:equatable/equatable.dart';
import '../../../../../core/resource/app_enum.dart';
import '../../../domain/entities/response/home_posts_response_entity.dart';

class FireStoreHomePostsState extends Equatable {
  final HomePostsResponseEntity entity;
  final CubitStatus status;
  final String error;

  const FireStoreHomePostsState({
    required this.error,
    required this.entity,
    required this.status,
  });

  factory FireStoreHomePostsState.initial() {
    return FireStoreHomePostsState(
        error: '',
        entity: HomePostsResponseEntity(),
        status: CubitStatus.initial);
  }

  @override
  bool get stringify => true;

  FireStoreHomePostsState copyWith(
      {String? error, HomePostsResponseEntity? entity, CubitStatus? status}) {
    return FireStoreHomePostsState(
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
