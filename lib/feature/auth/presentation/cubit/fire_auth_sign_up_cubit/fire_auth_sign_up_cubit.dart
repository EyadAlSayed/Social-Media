import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/feature/auth/domain/entities/request/signup_request_entity.dart';
import 'package:social_media/feature/auth/domain/usecases/fire_auth_usecase/fire_auth_signup_usecase.dart';
import '../../../../../core/network/error/network_error_handler.dart';
import '../../../../../core/network/error/network_failures.dart';
import '../../../../../core/network/firestore/core/firestore_base_model.dart';
import '../../../../../core/resource/app_enum.dart';

part 'fire_auth_sign_up_state.dart';

class FireAuthSignUpCubit extends Cubit<FireAuthSignUpState> {
  final FireAuthSignUpUsecase usecase;

  FireAuthSignUpCubit({
    required this.usecase,
  }) : super(FireAuthSignUpState.initial());

  void signUp(
      {BuildContext? buildContext, required SignupRequestEntity entity}) async {
    emit(state.copyWith(status: CubitStatus.loading));

    Either<NetworkFailure, Unit> result = await usecase(entity: entity);

    if (isClosed) return;

    result.fold(
      (failure) async {
        final ErrorEntity errorEntity = await NetworkErrorHandler.mapFailure(
            failure: failure, buildContext: buildContext);
        emit(state.copyWith(
            error: errorEntity.errorMessage, status: CubitStatus.error));
      },
      (data) {
        emit(state.copyWith(status: CubitStatus.success));
      },
    );
  }
}
