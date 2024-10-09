import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/feature/auth/presentation/cubit/fire_auth_login_cubit/fire_auth_login_cubit.dart';
import 'package:social_media/feature/auth/presentation/screen/auth_type_screen.dart';
import 'package:social_media/feature/main/presentation/screen/main_screen.dart';
import 'package:social_media/feature/story/presentation/screen/story_screen.dart';
import '../core/injection/injection_container.dart';
import '../core/navigation/fade_builder_route.dart';
import '../core/widget/page/not_found_page.dart';
import '../feature/auth/presentation/screen/login_by_fireauth_screen.dart';
import '../feature/intro/presentation/screen/splash_screen.dart';
import '../feature/main/presentation/cubit/home_posts_cubit/fire_store_home_posts_cubit.dart';
import '../feature/main/presentation/cubit/home_story_cubit/fire_store_home_story_cubit.dart';
import '../feature/notification/presentation/screen/notification_screen.dart';
import 'app_router_screens_name.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */
abstract class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    final argument = settings.arguments;

    switch (settings.name) {
      case AppRouterScreenNames.splash:
        return FadeBuilderRoute(page: const SplashScreen());
      case AppRouterScreenNames.main:
        return FadeBuilderRoute(
            page: MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) =>
                getIt<FireStoreHomePostsCubit>()..getHomePosts(),
          ),
          BlocProvider(
            create: (context) =>
                getIt<FireStoreHomeStoryCubit>()..getHomeStory(),
          ),
          // TODO add more BlocProvider if needed
        ], child: const MainScreen()));
      case AppRouterScreenNames.story:
        StoryArgs args = argument as StoryArgs;
        return FadeBuilderRoute(
            page: StoryScreen(
          args: args,
        ));
      case AppRouterScreenNames.loginByFireAuth:
        return FadeBuilderRoute(
            page: MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => getIt<FireAuthLoginCubit>(),
          ),
          // TODO add more BlocProvider if needed
        ], child: const LoginByFireAuthScreen()));
      case AppRouterScreenNames.authType:
        return FadeBuilderRoute(page: const AuthTypeScreen());
      case AppRouterScreenNames.notification:
        return FadeBuilderRoute(page: const NotificationScreen());
      default:
        return MaterialPageRoute(builder: (context) => const NotFoundScreen());

      //Signup
    }
  }
}
