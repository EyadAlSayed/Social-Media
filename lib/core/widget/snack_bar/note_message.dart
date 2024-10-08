import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media/core/widget/text/app_text_widget.dart';
import '../../resource/app_color.dart';
import '../../resource/app_font.dart';
import '../../resource/app_icon.dart';
import '../../resource/app_size.dart';
/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

abstract class NoteMessage {
  static showErrorSnackBar({
    required BuildContext context,
    required String text,
    void Function()? onTap,
    int? duration,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: AppWidth.w100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: AppTextWidget(
                  text: text,
                  fontSize: AppFontSize.fs14,
                  color: AppColor.red,
                  fontWeight: FontWeight.bold,
                  maxLines: maxLines ?? 2,
                ),
              ),
              SizedBox(
                width: AppWidth.w2,
              ),
              GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                  child: SvgPicture.asset(AppIcon.warning,
                      colorFilter: const ColorFilter.mode(
                          AppColor.red, BlendMode.srcIn)))
            ],
          ),
        ),
      ),
      backgroundColor: AppColor.white,
      duration: Duration(seconds: duration ?? 2),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: const BorderSide(width: 2, color: AppColor.red),
      ),
    ));
  }

  static showSuccessSnackBar({
    required BuildContext context,
    required String text,
    void Function()? onTap,
    int? duration,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: AppWidth.w100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: AppTextWidget(
                  text: text,
                  fontSize: AppFontSize.fs14,
                  color: AppColor.green,
                  fontWeight: FontWeight.bold,
                  maxLines: maxLines ?? 2,
                ),
              ),
              SizedBox(
                width: AppWidth.w2,
              ),
              GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                  child: SvgPicture.asset(AppIcon.done,
                      colorFilter: const ColorFilter.mode(
                          AppColor.green, BlendMode.srcIn)))
            ],
          ),
        ),
      ),
      backgroundColor: AppColor.white,
      duration: Duration(seconds: duration ?? 2),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: const BorderSide(width: 2, color: AppColor.green),
      ),
    ));
  }
}
