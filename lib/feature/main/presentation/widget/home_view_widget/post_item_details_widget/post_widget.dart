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

class PostTag extends StatelessWidget {
  const PostTag({super.key, required this.tag});

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppWidth.w2, vertical: AppHeight.h05),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppPixel.p20),
          color: AppColor.offWhite,
          boxShadow: [
            BoxShadow(
                color: AppColor.offWhite,
                offset: const Offset(0, 1),
                spreadRadius: 0,
                blurRadius: 6,
                blurStyle: BlurStyle.normal)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppIcon.tag,
            colorFilter: ColorFilter.mode(AppColor.black, BlendMode.srcIn),
          ),
          SizedBox(
            width: AppWidth.w2,
          ),
          AppTextWidget(
            text: tag,
            fontSize: AppFontSize.fs16,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
