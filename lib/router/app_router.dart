import 'package:flutter/material.dart';
import 'package:social_media/feature/auth/presentation/screen/auth_type_screen.dart';
import 'package:social_media/feature/main/presentation/screen/main_screen.dart';
import 'package:social_media/feature/story/presentation/screen/story_screen.dart';
import '../core/navigation/fade_builder_route.dart';
import '../core/widget/page/not_found_page.dart';
import '../feature/auth/presentation/screen/login_by_fireauth_screen.dart';
import '../feature/intro/presentation/screen/splash_screen.dart';
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
        return FadeBuilderRoute(page: const MainScreen());
        case AppRouterScreenNames.story:
          return FadeBuilderRoute(page: const StoryScreen());
      case AppRouterScreenNames.loginByFireAuth:
        return FadeBuilderRoute(page: const LoginByFireAuthScreen());
      case AppRouterScreenNames.authType:
        return FadeBuilderRoute(page: const AuthTypeScreen());
      default:
        return MaterialPageRoute(builder: (context) => const NotFoundScreen());

      //Signup
    }
  }
}
