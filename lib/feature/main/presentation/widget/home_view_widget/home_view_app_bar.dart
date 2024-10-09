import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media/core/resource/app_color.dart';
import 'package:social_media/core/resource/app_font.dart';
import 'package:social_media/core/resource/app_icon.dart';
import 'package:social_media/core/resource/app_size.dart';
import 'package:social_media/core/widget/text/app_text_widget.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({super.key, required this.onNotificationTaped});

  final Function() onNotificationTaped;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
            onTap: onNotificationTaped,
            child: SvgPicture.asset(AppIcon.notification)),
        AppTextWidget(
          text: "SOCIALLY",
          color: AppColor.white,
          fontSize: AppFontSize.fs18,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.5,
        ),
        SizedBox(
          width: AppWidth.w3point8,
        )
      ],
    );
  }
}
