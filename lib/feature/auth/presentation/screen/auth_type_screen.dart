import 'package:flutter/material.dart';
import 'package:social_media/core/resource/app_color.dart';
import 'package:social_media/core/resource/app_font.dart';
import 'package:social_media/core/resource/app_size.dart';
import 'package:social_media/core/widget/button/app_button.dart';
import 'package:social_media/core/widget/text/app_text_widget.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/8/2024.
 */

class AuthTypeScreen extends StatelessWidget {
  const AuthTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: AppHeight.h10,
            ),
            AppTextWidget(
              text: "Login please to continue",
              fontWeight: FontWeight.w600,
              fontSize: AppFontSize.fs18,
              color: AppColor.darkBlue,
            ),
            SizedBox(
              height: AppHeight.h2,
            ),
            AppButton(
              height: AppHeight.h7,
              width: AppWidth.w80,
              borderRadius: BorderRadius.circular(AppRadius.r20),
              borderColor: AppColor.darkBlue,
              color: AppColor.white,
              child: AppTextWidget(
                text: "Firebase",
                fontWeight: FontWeight.w600,
                fontSize: AppFontSize.fs16,
                color: AppColor.darkBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
