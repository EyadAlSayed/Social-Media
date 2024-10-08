import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/storage/shared/app_shared_preferences.dart';
import 'package:social_media/feature/auth/domain/entities/request/login_request_entity.dart';
import 'package:social_media/feature/auth/domain/usecases/fire_auth_usecase/fire_auth_login_usecase.dart';
import '../../../../../core/network/error/network_error_handler.dart';
import '../../../../../core/network/error/network_failures.dart';
import '../../../../../core/network/firestore/core/firestore_base_model.dart';
import '../../../../../core/resource/app_enum.dart';

part 'fire_auth_login_state.dart';

class FireAuthLoginCubit extends Cubit<FireAuthLoginState> {
  final FireAuthLoginUsecase usecase;

  FireAuthLoginCubit({
    required this.usecase,
  }) : super(FireAuthLoginState.initial());

  void login(
      { BuildContext? buildContext,
      required LoginRequestEntity entity}) async {
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
        AppSharedPreferences.cashLoggedIn(isLoggedIn: true);
        emit(state.copyWith(status: CubitStatus.success));
      },
    );
  }
}
