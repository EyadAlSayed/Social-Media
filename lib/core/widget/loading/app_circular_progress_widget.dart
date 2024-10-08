import 'package:flutter/material.dart';

import '../../resource/app_color.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */
class AppCircularProgressWidget extends StatelessWidget {
  final Color? color;

  const AppCircularProgressWidget({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color ?? AppColor.darkBlue,
    );
  }
}
