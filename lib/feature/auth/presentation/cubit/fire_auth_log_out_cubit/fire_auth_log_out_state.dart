part of 'fire_auth_log_out_cubit.dart';

class FireAuthLogOutState extends Equatable {
  final FireStoreBaseModel model;
  final CubitStatus status;

  const FireAuthLogOutState({
    required this.model,
    required this.status,
  });

  factory FireAuthLogOutState.initial() {
    return FireAuthLogOutState(
        model: FireStoreBaseModel(), status: CubitStatus.initial);
  }

  @override
  bool get stringify => true;

  FireAuthLogOutState copyWith(
      {String? error, FireStoreBaseModel? model, CubitStatus? status}) {
    return FireAuthLogOutState(
      model: model ?? this.model,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props {
    return [status, model];
  }
}
