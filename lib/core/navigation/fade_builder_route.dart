import 'package:flutter/material.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

class FadeBuilderRoute extends PageRouteBuilder {
  final Widget page;
  FadeBuilderRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
