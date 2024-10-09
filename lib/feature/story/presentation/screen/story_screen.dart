import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:social_media/core/resource/app_color.dart';
import 'package:social_media/core/resource/app_font.dart';
import 'package:social_media/core/resource/app_icon.dart';
import 'package:social_media/core/resource/app_size.dart';
import 'package:social_media/core/widget/image/app_image_widget.dart';
import 'package:social_media/core/widget/text/app_text_widget.dart';
import 'package:social_media/feature/main/presentation/widget/home_view_widget/post_item_details_widget/post_widget.dart';
import 'package:story_time/story_page_view/story_page_view.dart';

import '../../../main/domain/entities/response/home_story_response_entity.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

class StoryArgs {
  final Stories story;

  StoryArgs({required this.story});
}

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key, required this.args});

  final StoryArgs args;

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        StoryPageView(
          onPageBack: (newPageIndex) {
            Navigator.of(context).pop();
          },
          onPageForward: (newPageIndex) {
            Navigator.of(context).pop();
          },
          itemBuilder: (context, pageIndex, storyIndex) {
            return AppImageWidget(
                imageUrl: widget.args.story.storyImages?[storyIndex] ?? "");
          },
          storyLength: (pageIndex) {
            return widget.args.story.storyImages?.length ?? 0;
          },
          pageLength: 1,
        ),
        Container(
          margin: EdgeInsets.only(
              left: AppWidth.w5, right: AppWidth.w5, top: AppHeight.h5point2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppWidth.w4,
                          vertical: AppHeight.h1point5),
                      decoration: BoxDecoration(
                          color: AppColor.offWhite,
                          borderRadius: BorderRadius.circular(AppPixel.p10)),
                      child: SvgPicture.asset(
                        AppIcon.arrowRight,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: AppWidth.w2,
                  ),
                  AppTextWidget(
                    text: widget.args.story.userName ?? "",
                    fontSize: AppFontSize.fs16,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    width: AppWidth.w2,
                  ),
                  AppTextWidget(
                    text: widget.args.story.createdAt ?? "",
                    fontSize: AppFontSize.fs16,
                    fontWeight: FontWeight.w600,
                    color: AppColor.offWhite,
                  ),
                ],
              ),
              SvgPicture.asset(AppIcon.download),
            ],
          ),
        ),
        if ((widget.args.story.storyTags ?? []).isNotEmpty)
          Positioned(
            top: AppHeight.h64,
            left: AppWidth.w50,
            child: PostTag(
              tag: widget.args.story.storyTags?.first ?? "",
            ),
          ),
        GestureDetector(
          onTap: () {
            setState(() {
              isLike = !isLike;
            });
          },
          child: Container(
            margin: EdgeInsets.only(
                left: AppWidth.w5,
                right: AppWidth.w5,
                bottom: AppHeight.h5point2),
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(
              width: AppPixel.p26,
              height: AppPixel.p26,
              isLike == false ? AppIcon.heart : AppIcon.filledHeart,
              colorFilter: ColorFilter.mode(AppColor.white, BlendMode.srcIn),
            ),
          ),
        )
      ],
    ));
  }
}
