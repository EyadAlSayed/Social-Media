import 'package:equatable/equatable.dart';
import '../../../../../core/resource/app_enum.dart';
import '../../../domain/entities/response/home_story_response_entity.dart';

class FireStoreHomeStoryState extends Equatable {
  final HomeStoryResponseEntity entity;
  final CubitStatus status;
  final String error;

  const FireStoreHomeStoryState({
    required this.error,
    required this.entity,
    required this.status,
  });

  factory FireStoreHomeStoryState.initial() {
    return FireStoreHomeStoryState(
        error: '', entity: HomeStoryResponseEntity(), status: CubitStatus.initial);
  }

  @override
  bool get stringify => true;

  FireStoreHomeStoryState copyWith(
      {String? error, HomeStoryResponseEntity? entity, CubitStatus? status}) {
    return FireStoreHomeStoryState(
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
