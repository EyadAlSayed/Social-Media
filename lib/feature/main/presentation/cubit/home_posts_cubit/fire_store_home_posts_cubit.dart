import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/network/error/network_error_handler.dart';
import '../../../../../core/network/error/network_failures.dart';
import '../../../../../core/resource/app_enum.dart';
import '../../../domain/entities/response/home_posts_response_entity.dart';
import '../../../domain/usecases/fire_store_home/fire_store_home_posts_usecase.dart';
import 'fire_store_home_posts_state.dart';

class FireStoreHomePostsCubit extends Cubit<FireStoreHomePostsState> {
  final FireStoreHomePostsUsecase usecase;

  FireStoreHomePostsCubit({
    required this.usecase,
  }) : super(FireStoreHomePostsState.initial());

  void getHomePosts({BuildContext? buildContext}) async {
    emit(state.copyWith(status: CubitStatus.loading));

    Either<NetworkFailure, HomePostsResponseEntity> result = await usecase();

    if (isClosed) return;

    result.fold(
      (failure) async {
        final ErrorEntity errorEntity = await NetworkErrorHandler.mapFailure(
            failure: failure, buildContext: buildContext);
        emit(state.copyWith(
            error: errorEntity.errorMessage, status: CubitStatus.error));
      },
      (data) {
        emit(state.copyWith(status: CubitStatus.success,entity: data));
      },
    );
  }
}
