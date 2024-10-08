import 'package:flutter/material.dart';
import 'package:social_media/core/resource/app_color.dart';
import 'package:social_media/core/resource/app_font.dart';
import 'package:social_media/core/resource/app_size.dart';
import 'package:social_media/core/widget/text/app_text_widget.dart';
import 'package:social_media/feature/main/presentation/widget/home_view_widget/post_item_details_widget/post_header.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/8/2024.
 */

class CommentItem extends StatefulWidget {
  const CommentItem({super.key});

  @override
  State<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        PostHeader(),
        SizedBox(
          height: AppHeight.h1,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: AppWidth.w9),
          child: AppTextWidget(
            text: "text",
            fontSize: AppFontSize.fs16,
            fontWeight: FontWeight.w600,
            color: AppColor.darkBlue,
          ),
        ),
      ],
    );
  }
}
