import 'package:equatable/equatable.dart';

import '../../../../../core/network/firestore/core/firestore_base_model.dart';
import '../../../../../core/resource/app_enum.dart';

class FireAuthForgetPasswordState extends Equatable {
  final CubitStatus status;
  final String error;

  const FireAuthForgetPasswordState(
      {required this.status, required this.error});

  factory FireAuthForgetPasswordState.initial() {
    return FireAuthForgetPasswordState(error: '', status: CubitStatus.initial);
  }

  @override
  bool get stringify => true;

  FireAuthForgetPasswordState copyWith({String? error, CubitStatus? status}) {
    return FireAuthForgetPasswordState(
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props {
    return [status, error];
  }
}
