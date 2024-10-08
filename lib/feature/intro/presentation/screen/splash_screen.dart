import 'package:flutter/material.dart';

import '../../../../core/helper/app_info_helper.dart';
import '../../../../core/resource/app_color.dart';
import '../../../../core/resource/app_font.dart';
import '../../../../core/resource/app_image.dart';
import '../../../../core/resource/app_size.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../../../../router/app_router_screens_name.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    openNextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            AppImage.splash,
            width: AppWidth.w100,
            height: AppHeight.h100,
            fit: BoxFit.cover,
          ),
          Container(
              margin: EdgeInsets.only(bottom: AppHeight.h4),
              child: AppTextWidget(
                color: AppColor.black,
                text: "v${AppInfoHelper.getAppVersion()}",
                fontSize: AppFontSize.fs16,
                fontWeight: FontWeight.w600,
              ))
        ],
      ),
    );
  }

  void openNextPage() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        Navigator.of(context).pushNamedAndRemoveUntil(
            AppRouterScreenNames.main, (route) => false);
      },
    );
  }
}
