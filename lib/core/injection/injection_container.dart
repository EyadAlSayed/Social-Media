import 'package:get_it/get_it.dart';
import 'package:social_media/feature/auth/data/datasources/remot/api_auth_remote.dart';
import 'package:social_media/feature/auth/data/datasources/remot/fire_auth_remote.dart';
import 'package:social_media/feature/auth/domain/usecases/fire_auth_usecase/fire_auth_login_usecase.dart';
import 'package:social_media/feature/auth/presentation/cubit/fire_auth_log_out_cubit/fire_auth_log_out_cubit.dart';
import '../../feature/auth/data/repositories/auth_repository_implements.dart';
import '../../feature/auth/domain/repositories/api_auth_repository.dart';
import '../../feature/auth/domain/usecases/fire_auth_usecase/fire_auth_forget_password_usecase.dart';
import '../../feature/auth/domain/usecases/fire_auth_usecase/fire_auth_logout_usecase.dart';
import '../../feature/auth/domain/usecases/fire_auth_usecase/fire_auth_signup_usecase.dart';
import '../../feature/auth/presentation/cubit/fire_auth_forget_password_cubit/fire_auth_forget_password_cubit.dart';
import '../../feature/auth/presentation/cubit/fire_auth_login_cubit/fire_auth_login_cubit.dart';
import '../../feature/auth/presentation/cubit/fire_auth_sign_up_cubit/fire_auth_sign_up_cubit.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */
final getIt = GetIt.instance;

Future<void> initDI() async {
  getIt.registerFactory(() => FireAuthLoginCubit(usecase: getIt()));
  getIt.registerFactory(() => FireAuthSignUpCubit(usecase: getIt()));
  getIt.registerFactory(() => FireAuthForgetPasswordCubit(usecase: getIt()));
  getIt.registerFactory(() => FireAuthLogOutCubit(usecase: getIt()));

  getIt.registerLazySingleton(() => FireAuthLoginUsecase(repository: getIt()));
  getIt.registerLazySingleton(() => FireAuthSignUpUsecase(repository: getIt()));
  getIt.registerLazySingleton(
      () => FireAuthForgetPasswordUsecase(repository: getIt()));
  getIt.registerLazySingleton(() => FireAuthLogOutUsecase(repository: getIt()));

  getIt.registerLazySingleton<ApiAuthRepository>(
    () => AuthRepositoryImplements(
        fireAuthRemote: getIt(), apiAuthRemote: getIt()),
  );
  getIt.registerLazySingleton<FireAuthRemote>(() => FireAuthRemoteImplement());
  getIt.registerLazySingleton<ApiAuthRemote>(() => ApiAuthRemoteImplement());
}
