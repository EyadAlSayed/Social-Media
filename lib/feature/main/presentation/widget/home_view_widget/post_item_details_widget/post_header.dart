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
  const PostHeader({
    super.key,
    required this.userName,
    required this.createdAt,
    required this.userImage,
    this.taggedUser = '',
  });

  final String userName, userImage, taggedUser, createdAt;

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
              child: AppImageWidget(
                imageUrl: userImage,
              ),
            ),
            SizedBox(
              width: AppWidth.w2,
            ),
            AppTextWidget(
              text: userName,
              fontWeight: FontWeight.w600,
              fontSize: AppFontSize.fs16,
              color: AppColor.darkGrey,
            ),
            Visibility(
              visible: taggedUser.isNotEmpty,
              child: Row(
                children: [
                  SizedBox(
                    width: AppWidth.w1,
                  ),
                  AppTextWidget(
                    text: "with",
                    fontWeight: FontWeight.w700,
                    fontSize: AppFontSize.fs17,
                    color: AppColor.darkGrey,
                  ),
                  SizedBox(
                    width: AppWidth.w1,
                  ),
                  AppTextWidget(
                    text: taggedUser,
                    fontWeight: FontWeight.w600,
                    fontSize: AppFontSize.fs16,
                    color: AppColor.darkGrey,
                  )
                ],
              ),
            ),
          ],
        ),
        AppTextWidget(
          text: createdAt,
          fontWeight: FontWeight.w600,
          fontSize: AppFontSize.fs16,
          color: AppColor.darkGrey.withOpacity(0.6),
        )
      ],
    );
  }
}
