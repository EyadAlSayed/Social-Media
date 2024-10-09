import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media/core/resource/app_color.dart';
import 'package:social_media/core/resource/app_font.dart';
import 'package:social_media/core/resource/app_icon.dart';
import 'package:social_media/core/resource/app_size.dart';
import 'package:social_media/core/widget/text/app_text_widget.dart';
import 'package:social_media/feature/main/presentation/widget/home_view_widget/bottom_sheet/comment_bottom_sheet.dart';

import '../../../../domain/entities/response/home_posts_response_entity.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

class PostButton extends StatefulWidget {
  PostButton(
      {super.key,
      required this.totalComments,
      required this.totalLikes,
      required this.isLike,
      required this.posts,
      required this.comments,
      required this.itemIndex});

  num? totalLikes, totalComments;
  final List<Posts> posts;
  final int itemIndex;
  final List<Comments> comments;
  bool isLike;

  @override
  State<PostButton> createState() => _PostButtonState();
}

class _PostButtonState extends State<PostButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppWidth.w2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    widget.isLike = !widget.isLike;
                    if (widget.isLike == true) {
                      widget.totalLikes =
                          ((widget.totalLikes ?? 0).toInt() + 1);
                    } else {
                      widget.totalLikes =
                          ((widget.totalLikes ?? 0).toInt() - 1);
                    }
                  });

                  // TODO handle like remote functionality
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      widget.isLike ? AppIcon.filledHeart : AppIcon.heart,
                      colorFilter:
                          ColorFilter.mode(AppColor.darkGrey, BlendMode.srcIn),
                    ),
                    SizedBox(
                      width: AppWidth.w2,
                    ),
                    AppTextWidget(
                      text: widget.totalLikes.toString(),
                      fontWeight: FontWeight.w600,
                      fontSize: AppFontSize.fs16,
                      color: AppColor.darkGrey.withOpacity(0.6),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: AppWidth.w3point8,
              ),
              InkWell(
                onTap: () {
                  showCommentBottomSheet(
                    context: context,
                    comments: widget.comments,
                    itemIndex: widget.itemIndex,
                    posts: widget.posts,
                  );
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
                      text: widget.totalComments.toString(),
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
