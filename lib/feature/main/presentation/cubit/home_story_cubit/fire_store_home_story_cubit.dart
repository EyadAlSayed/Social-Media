import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/network/error/network_error_handler.dart';
import '../../../../../core/network/error/network_failures.dart';
import '../../../../../core/resource/app_enum.dart';
import '../../../domain/entities/response/home_story_response_entity.dart';
import '../../../domain/usecases/fire_store_home/fire_store_home_story_usecase.dart';
import 'fire_store_home_story_state.dart';

class FireStoreHomeStoryCubit extends Cubit<FireStoreHomeStoryState> {
  final FireStoreHomeStoryUsecase usecase;

  FireStoreHomeStoryCubit({
    required this.usecase,
  }) : super(FireStoreHomeStoryState.initial());

  void getHomeStory({BuildContext? buildContext}) async {
    emit(state.copyWith(status: CubitStatus.loading));

    Either<NetworkFailure, HomeStoryResponseEntity> result = await usecase();

    if (isClosed) return;

    result.fold(
      (failure) async {
        final ErrorEntity errorEntity = await NetworkErrorHandler.mapFailure(
            failure: failure, buildContext: buildContext);
        emit(state.copyWith(
            error: errorEntity.errorMessage, status: CubitStatus.error));
      },
      (data) {
        emit(state.copyWith(status: CubitStatus.success, entity: data));
      },
    );
  }
}
