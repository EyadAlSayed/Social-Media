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

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        StoryPageView(
          itemBuilder: (context, pageIndex, storyIndex) {
            return AppImageWidget(
              imageUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmCy16nhIbV3pI1qLYHMJKwbH2458oiC9EmA&s",
            );
          },
          storyLength: (pageIndex) {
            return 3;
          },
          pageLength: 2,
        ),
        Container(
          margin: EdgeInsets.only(
              left: AppWidth.w5,
              right: AppWidth.w5,
              top: AppHeight.h5point2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppWidth.w4,
                        vertical: AppHeight.h1point5),
                    decoration: BoxDecoration(
                        color: AppColor.offWhite,
                        borderRadius:
                            BorderRadius.circular(AppRadius.r10)),
                    child: SvgPicture.asset(
                      AppIcon.arrowRight,

                    ),
                  ),
                  SizedBox(
                    width: AppWidth.w2,
                  ),
                  AppTextWidget(
                    text: "Mariano Di Vaio",
                    fontSize: AppFontSize.fs16,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    width: AppWidth.w2,
                  ),
                  AppTextWidget(
                    text: "17m",
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
        Positioned(
          top: AppHeight.h64,
          left: AppWidth.w50,
          child: Container(
            width: AppWidth.w29,
            child: PostTag(),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              left: AppWidth.w5,
              right: AppWidth.w5,
              bottom: AppHeight.h5point2),
          alignment: Alignment.bottomRight,
          child: SvgPicture.asset(
            width: 26.px,
            height: 26.px,
            AppIcon.heart,
            colorFilter:
                ColorFilter.mode(AppColor.white, BlendMode.srcIn),
          ),
        )
      ],
    ));
  }
}
