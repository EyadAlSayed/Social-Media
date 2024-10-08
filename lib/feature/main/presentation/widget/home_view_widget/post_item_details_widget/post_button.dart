import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media/core/resource/app_color.dart';
import 'package:social_media/core/resource/app_font.dart';
import 'package:social_media/core/resource/app_icon.dart';
import 'package:social_media/core/resource/app_size.dart';
import 'package:social_media/core/widget/text/app_text_widget.dart';
import 'package:social_media/feature/main/presentation/widget/home_view_widget/bottom_sheet/comment_bottom_sheet.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

class PostButton extends StatelessWidget {
  const PostButton({super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppWidth.w2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    AppIcon.heart,
                    colorFilter: ColorFilter.mode(
                        AppColor.darkGrey, BlendMode.srcIn),
                  ),
                  SizedBox(
                    width: AppWidth.w2,
                  ),
                  AppTextWidget(
                    text: "1320",
                    fontWeight: FontWeight.w600,
                    fontSize: AppFontSize.fs16,
                    color: AppColor.darkGrey.withOpacity(0.6),
                  ),
                ],
              ),
              SizedBox(
                width: AppWidth.w3Point8,
              ),
              InkWell(
                onTap: () {
                  showCommentBottomSheet(context: context);
                },
                child: Row(
                  children: [
                    SvgPicture.asset(AppIcon.comment,
                        colorFilter: ColorFilter.mode(
                            AppColor.darkGrey, BlendMode.srcIn)),
                    SizedBox(
                      width: AppWidth.w2,
                    ),
                    AppTextWidget(
                      text: "23",
                      fontWeight: FontWeight.w600,
                      fontSize: AppFontSize.fs16,
                      color: AppColor.darkGrey.withOpacity(0.6),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SvgPicture.asset(AppIcon.save),
        ],
      ),
    );
  }
}
