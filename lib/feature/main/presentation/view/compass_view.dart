import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media/core/resource/app_color.dart';
import 'package:social_media/core/resource/app_font.dart';
import 'package:social_media/core/widget/text/app_text_widget.dart';

import '../../../../core/resource/app_icon.dart';
import '../../../../core/resource/app_size.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

class CompassView extends StatelessWidget {
  const CompassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppWidth.w3Point8),
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
                    AppIcon.compass,
                    colorFilter:
                        ColorFilter.mode(AppColor.white, BlendMode.srcIn),
                  ),
                  SizedBox(
                    height: AppHeight.h2,
                  ),
                  AppTextWidget(
                    text: "No data to display",
                    fontWeight: FontWeight.w600,
                    fontSize: AppFontSize.fs18,
                    color: AppColor.white,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
