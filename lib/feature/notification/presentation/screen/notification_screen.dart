import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resource/app_color.dart';
import '../../../../core/resource/app_font.dart';
import '../../../../core/resource/app_icon.dart';
import '../../../../core/resource/app_size.dart';
import '../../../../core/widget/text/app_text_widget.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/8/2024.
 */

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppWidth.w3point8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SvgPicture.asset(
                      width: AppWidth.w30,
                      height: AppWidth.w30,
                      AppIcon.notification,
                      colorFilter:
                          ColorFilter.mode(AppColor.darkBlue, BlendMode.srcIn),
                    ),
                    SizedBox(
                      height: AppHeight.h2,
                    ),
                    AppTextWidget(
                      text: "No data to display",
                      fontWeight: FontWeight.w600,
                      fontSize: AppFontSize.fs18,
                      color: AppColor.darkBlue,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
