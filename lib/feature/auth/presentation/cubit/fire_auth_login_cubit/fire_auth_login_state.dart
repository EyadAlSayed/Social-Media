part of 'fire_auth_login_cubit.dart';

class FireAuthLoginState extends Equatable {
  final CubitStatus status;
  final String error;

  const FireAuthLoginState({
    required this.status,
    required this.error,
  });

  factory FireAuthLoginState.initial() {
    return FireAuthLoginState(error: '', status: CubitStatus.initial);
  }

  @override
  bool get stringify => true;

  FireAuthLoginState copyWith({String? error, CubitStatus? status}) {
    return FireAuthLoginState(
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props {
    return [status, error];
  }
}
