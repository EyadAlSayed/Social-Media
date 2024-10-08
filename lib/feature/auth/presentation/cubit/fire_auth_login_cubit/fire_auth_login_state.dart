part of 'fire_auth_login_cubit.dart';

class FireAuthLoginState extends Equatable {
  final FireStoreBaseModel model;
  final CubitStatus status;

  const FireAuthLoginState({
    required this.model,
    required this.status,
  });

  factory FireAuthLoginState.initial() {
    return FireAuthLoginState(
        model: FireStoreBaseModel(), status: CubitStatus.initial);
  }

  @override
  bool get stringify => true;

  FireAuthLoginState copyWith(
      {String? error, FireStoreBaseModel? model, CubitStatus? status}) {
    return FireAuthLoginState(
      model: model ?? this.model,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props {
    return [status, model];
  }
}
