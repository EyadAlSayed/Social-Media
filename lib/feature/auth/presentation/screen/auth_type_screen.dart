import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media/core/resource/app_color.dart';
import 'package:social_media/core/resource/app_font.dart';
import 'package:social_media/core/resource/app_icon.dart';
import 'package:social_media/core/resource/app_size.dart';
import 'package:social_media/core/widget/button/app_button.dart';
import 'package:social_media/core/widget/text/app_text_widget.dart';
import 'package:social_media/router/app_router_screens_name.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/8/2024.
 */

class AuthTypeScreen extends StatelessWidget {
  const AuthTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: AppHeight.h10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextWidget(
                text: "Choose method to login please",
                fontWeight: FontWeight.w600,
                fontSize: AppFontSize.fs18,
                color: AppColor.darkBlue,
              ),
            ],
          ),
          SizedBox(
            height: AppHeight.h5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppButton(
                height: AppHeight.h7,
                width: AppWidth.w80,
                borderRadius: BorderRadius.circular(AppPixel.p20),
                borderColor: AppColor.darkBlue,
                outLinedBorder: true,
                color: AppColor.white,
                alignment: Alignment.center,
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(AppRouterScreenNames.loginByFireAuth);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTextWidget(
                      text: "Firebase",
                      fontWeight: FontWeight.w600,
                      fontSize: AppFontSize.fs16,
                      color: AppColor.darkBlue,
                    ),
                    SizedBox(
                      width: AppWidth.w2,
                    ),
                    SvgPicture.asset(
                      AppIcon.firebase,
                      colorFilter:
                          ColorFilter.mode(AppColor.darkBlue, BlendMode.srcIn),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
