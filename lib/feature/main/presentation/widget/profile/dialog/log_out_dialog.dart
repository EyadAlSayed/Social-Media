import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:social_media/core/helper/hive_hepler.dart';
import 'package:social_media/core/resource/app_font.dart';
import 'package:social_media/core/storage/shared/app_shared_preferences.dart';
import 'package:social_media/core/widget/button/app_button.dart';
import 'package:social_media/router/app_router.dart';
import 'package:social_media/router/app_router_screens_name.dart';
import '../../../../../../core/resource/app_color.dart';
import '../../../../../../core/resource/app_size.dart';
import '../../../../../../core/widget/text/app_text_widget.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/9/2024.
 */

void showLogOutDialog({required BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppPixel.p10)),
        contentPadding: EdgeInsets.only(
            left: AppWidth.w4,
            right: AppWidth.w4,
            top: AppHeight.h05,
            bottom: AppHeight.h3),
        insetPadding: EdgeInsets.symmetric(
          horizontal: AppWidth.w4,
        ),
        elevation: 0,
        backgroundColor: AppColor.white,
        title: Padding(
          padding: EdgeInsets.only(bottom: AppHeight.h1point5),
          child: AppTextWidget(
            text: "Logout",
            fontWeight: FontWeight.w600,
            fontSize: AppFontSize.fs18,
            overflow: TextOverflow.visible,
            color: AppColor.grey,
            textAlign: TextAlign.center,
          ),
        ),
        content: AppTextWidget(
          color: AppColor.darkBlue,
          text: "Are you sure that your want to logout ?",
          fontWeight: FontWeight.w600,
          fontSize: AppFontSize.fs16,
          overflow: TextOverflow.visible,
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppButton(
                width: AppWidth.w100 / 2.6,
                borderRadius: BorderRadius.circular(AppPixel.p10),
                height: AppHeight.h5,
                onTap: () {
                  AppSharedPreferences.clear();
                  HiveHelper.clear();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRouterScreenNames.authType,
                    (route) => false,
                  );
                },
                color: AppColor.white,
                alignment: Alignment.center,
                child: AppTextWidget(
                  text: "Logout",
                  fontSize: AppFontSize.fs16,
                ),
              ),
              SizedBox(
                width: AppWidth.w1,
              ),
              AppButton(
                width: AppWidth.w100 / 2.6,
                padding: EdgeInsets.symmetric(
                    horizontal: AppWidth.w10, vertical: AppHeight.h1),
                borderRadius: BorderRadius.circular(AppPixel.p10),
                onTap: () {
                  Navigator.pop(context);
                },
                alignment: Alignment.center,
                color: AppColor.darkBlue,
                child: AppTextWidget(
                  text: "Cancel",
                  color: AppColor.white,
                  fontSize: AppFontSize.fs16,
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
