part of 'fire_auth_sign_up_cubit.dart';

class FireAuthSignUpState extends Equatable {
  final CubitStatus status;
  final String error;

  const FireAuthSignUpState({
    required this.error,
    required this.status,
  });

  factory FireAuthSignUpState.initial() {
    return FireAuthSignUpState(error: '', status: CubitStatus.initial);
  }

  @override
  bool get stringify => true;

  FireAuthSignUpState copyWith(
      {String? error, FireStoreBaseModel? model, CubitStatus? status}) {
    return FireAuthSignUpState(
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props {
    return [status, error];
  }
}
