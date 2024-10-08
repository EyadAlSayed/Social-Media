part of 'fire_auth_sign_up_cubit.dart';

class FireAuthSignUpState extends Equatable {
  final FireStoreBaseModel model;
  final CubitStatus status;

  const FireAuthSignUpState({
    required this.model,
    required this.status,
  });

  factory FireAuthSignUpState.initial() {
    return FireAuthSignUpState(
        model: FireStoreBaseModel(), status: CubitStatus.initial);
  }

  @override
  bool get stringify => true;

  FireAuthSignUpState copyWith(
      {String? error, FireStoreBaseModel? model, CubitStatus? status}) {
    return FireAuthSignUpState(
      model: model ?? this.model,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props {
    return [status, model];
  }
}
