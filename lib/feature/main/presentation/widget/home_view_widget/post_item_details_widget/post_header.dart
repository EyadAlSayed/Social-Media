
import 'package:flutter/cupertino.dart';
import 'package:social_media/core/resource/app_color.dart';
import 'package:social_media/core/resource/app_font.dart';
import 'package:social_media/core/resource/app_size.dart';
import 'package:social_media/core/widget/image/app_image_widget.dart';
import 'package:social_media/core/widget/text/app_text_widget.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */


class PostHeader extends StatelessWidget {
  const PostHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              width: AppWidth.w8,
              height: AppWidth.w8,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: const AppImageWidget(),
            ),
            SizedBox(
              width: AppWidth.w1,
            ),
            AppTextWidget(
              text: "Kylie Jenner",
              fontWeight: FontWeight.w600,
              fontSize: AppFontSize.fs16,
              color: AppColor.darkGrey,
            ),
            SizedBox(
              width: AppWidth.w1,
            ),
            Visibility(
              visible: true,
              child: AppTextWidget(
                text: "with",
                fontWeight: FontWeight.w700,
                fontSize: AppFontSize.fs17,
                color: AppColor.darkGrey,
              ),
            ),
            SizedBox(
              width: AppWidth.w1,
            ),
            Visibility(
              visible: true,
              child: AppTextWidget(
                text: "Zoe Sugg",
                fontWeight: FontWeight.w600,
                fontSize: AppFontSize.fs16,
                color: AppColor.darkGrey,
              ),
            )
          ],
        ),
        AppTextWidget(
          text: "2d ago",
          fontWeight: FontWeight.w600,
          fontSize: AppFontSize.fs16,
          color: AppColor.darkGrey.withOpacity(0.6),
        )
      ],
    );
  }
}
