import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media/core/resource/app_constant.dart';
import 'package:social_media/core/resource/app_image.dart';

import 'package:social_media/core/widget/image/app_image_widget.dart';
import 'dart:ui' as ui;
import '../../../../../core/resource/app_color.dart';
import '../../../../../core/resource/app_font.dart';
import '../../../../../core/resource/app_icon.dart';
import '../../../../../core/resource/app_size.dart';
import '../../../../../core/widget/text/app_text_widget.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({super.key, required this.onEditClicked});

  final void Function()? onEditClicked;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              height: AppHeight.h10,
              width: AppHeight.h10,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: const AppImageWidget(
                imageUrl: AppConstant.userImageUrl,
              ),
            ),
            SizedBox(
              width: AppWidth.w2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextWidget(
                  text: "User name",
                  fontWeight: FontWeight.w700,
                  fontSize: AppFontSize.fs17,
                ),
                SizedBox(
                  height: AppHeight.h02,
                ),
                Directionality(
                  textDirection: ui.TextDirection.ltr,
                  child: AppTextWidget(
                    text: "Phone number",
                    fontWeight: FontWeight.w600,
                    fontSize: AppFontSize.fs15,
                  ),
                ),
              ],
            ),
          ],
        ),
        SvgPicture.asset(
          AppIcon.edit,
        ),
      ],
    );
  }
}
