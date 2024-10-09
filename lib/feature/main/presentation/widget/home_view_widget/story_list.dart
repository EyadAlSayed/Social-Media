import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:social_media/core/widget/image/app_image_widget.dart';
import 'package:social_media/feature/story/presentation/screen/story_screen.dart';
import 'package:social_media/router/app_router_screens_name.dart';

import '../../../../../core/resource/app_color.dart';
import '../../../../../core/resource/app_size.dart';
import '../../../domain/entities/response/home_story_response_entity.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

class StoryList extends StatelessWidget {
  const StoryList({super.key, required this.stories});

  final List<Stories> stories;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: AppWidth.w2, vertical: AppHeight.h1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppPixel.p40),
          color: AppColor.darkBlue,
          boxShadow: [
            BoxShadow(
                color: AppColor.black,
                spreadRadius: 0,
                blurRadius: 9,
                offset: const Offset(0, 1))
          ]),
      child: SizedBox(
        height: AppHeight.h8,
        child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: AppWidth.w2),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return StoryItem(
                story: stories[index],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: AppWidth.w2,
              );
            },
            itemCount: stories.length),
      ),
    );
  }
}

class StoryItem extends StatelessWidget {
  const StoryItem({super.key, required this.story});

  final Stories story;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(AppRouterScreenNames.story,
            arguments: StoryArgs(story: story));
      },
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColor.white, width: AppPixel.p2point8)),
        child: Container(
          width: AppWidth.w14,
          height: AppWidth.w14,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: AppImageWidget(
            fit: BoxFit.fitHeight,
            imageUrl: story.userImage ?? "",
          ),
        ),
      ),
    );
  }
}
