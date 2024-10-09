import 'package:get_it/get_it.dart';
import 'package:social_media/feature/auth/data/datasources/remot/api_auth_remote.dart';
import 'package:social_media/feature/auth/data/datasources/remot/fire_auth_remote.dart';
import 'package:social_media/feature/auth/domain/usecases/fire_auth_usecase/fire_auth_login_usecase.dart';
import 'package:social_media/feature/main/data/datasources/remot/api_main_remote.dart';
import 'package:social_media/feature/main/data/datasources/remot/fire_store_main_remote.dart';
import 'package:social_media/feature/main/data/repositories/main_repository_implements.dart';
import 'package:social_media/feature/main/domain/repositories/api_main_repository.dart';
import 'package:social_media/feature/main/domain/repositories/fire_store_main_repository.dart';
import '../../feature/auth/data/repositories/auth_repository_implements.dart';
import '../../feature/auth/domain/repositories/api_auth_repository.dart';
import '../../feature/auth/domain/repositories/fire_auth_repository.dart';
import '../../feature/auth/domain/usecases/fire_auth_usecase/fire_auth_forget_password_usecase.dart';
import '../../feature/auth/domain/usecases/fire_auth_usecase/fire_auth_signup_usecase.dart';
import '../../feature/auth/presentation/cubit/fire_auth_forget_password_cubit/fire_auth_forget_password_cubit.dart';
import '../../feature/auth/presentation/cubit/fire_auth_login_cubit/fire_auth_login_cubit.dart';
import '../../feature/auth/presentation/cubit/fire_auth_sign_up_cubit/fire_auth_sign_up_cubit.dart';
import '../../feature/main/domain/usecases/fire_store_home/fire_store_home_posts_usecase.dart';
import '../../feature/main/domain/usecases/fire_store_home/fire_store_home_story_usecase.dart';
import '../../feature/main/presentation/cubit/home_posts_cubit/fire_store_home_posts_cubit.dart';
import '../../feature/main/presentation/cubit/home_story_cubit/fire_store_home_story_cubit.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */
final getIt = GetIt.instance;

Future<void> initDI() async {
  getIt.registerFactory(() => FireAuthLoginCubit(usecase: getIt()));
  getIt.registerFactory(() => FireAuthSignUpCubit(usecase: getIt()));
  getIt.registerFactory(() => FireAuthForgetPasswordCubit(usecase: getIt()));

  getIt.registerLazySingleton(() => FireAuthLoginUsecase(repository: getIt()));
  getIt.registerLazySingleton(() => FireAuthSignUpUsecase(repository: getIt()));
  getIt.registerLazySingleton(
      () => FireAuthForgetPasswordUsecase(repository: getIt()));

  getIt.registerLazySingleton<ApiAuthRepository>(
    () => AuthRepositoryImplements(
        fireAuthRemote: getIt(), apiAuthRemote: getIt()),
  );
  getIt.registerLazySingleton<FireAuthRepository>(
    () => AuthRepositoryImplements(
        fireAuthRemote: getIt(), apiAuthRemote: getIt()),
  );
  getIt.registerLazySingleton<FireAuthRemote>(() => FireAuthRemoteImplement());
  getIt.registerLazySingleton<ApiAuthRemote>(() => ApiAuthRemoteImplement());

  getIt.registerFactory(() => FireStoreHomePostsCubit(usecase: getIt()));
  getIt.registerFactory(() => FireStoreHomeStoryCubit(usecase: getIt()));
  getIt.registerLazySingleton(
      () => FireStoreHomePostsUsecase(repository: getIt()));
  getIt.registerLazySingleton(
      () => FireStoreHomeStoryUsecase(repository: getIt()));
  getIt.registerLazySingleton<ApiMainRepository>(
    () => MainRepositoryImplements(
        fireStoreMainRemote: getIt(), apiMainRemote: getIt()),
  );
  getIt.registerLazySingleton<FireStoreMainRepository>(
        () => MainRepositoryImplements(
        fireStoreMainRemote: getIt(), apiMainRemote: getIt()),
  );

  getIt.registerLazySingleton<FireStoreMainRemote>(
      () => FireStoreMainRemoteImplement());
  getIt.registerLazySingleton<ApiMainRemote>(() => ApiMainRemoteImplement());
}
