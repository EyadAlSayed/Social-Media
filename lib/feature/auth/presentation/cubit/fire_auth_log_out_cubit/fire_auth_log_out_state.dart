part of 'fire_auth_log_out_cubit.dart';

class FireAuthLogOutState extends Equatable {
  final CubitStatus status;
  final String error;

  const FireAuthLogOutState({
    required this.error,
    required this.status,
  });

  factory FireAuthLogOutState.initial() {
    return FireAuthLogOutState(error: '', status: CubitStatus.initial);
  }

  @override
  bool get stringify => true;

  FireAuthLogOutState copyWith({String? error, CubitStatus? status}) {
    return FireAuthLogOutState(
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props {
    return [status, error];
  }
}
