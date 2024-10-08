
import 'package:equatable/equatable.dart';

import '../../../../../core/network/firestore/core/firestore_base_model.dart';
import '../../../../../core/resource/app_enum.dart';

class FireAuthForgetPasswordState extends Equatable {
  final FireStoreBaseModel model;
  final CubitStatus status;

  const FireAuthForgetPasswordState({
    required this.model,
    required this.status,
  });

  factory FireAuthForgetPasswordState.initial() {
    return FireAuthForgetPasswordState(
        model: FireStoreBaseModel(), status: CubitStatus.initial);
  }

  @override
  bool get stringify => true;

  FireAuthForgetPasswordState copyWith(
      {String? error, FireStoreBaseModel? model, CubitStatus? status}) {
    return FireAuthForgetPasswordState(
      model: model ?? this.model,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props {
    return [status, model];
  }
}
