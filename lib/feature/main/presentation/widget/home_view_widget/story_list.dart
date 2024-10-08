import 'package:flutter/material.dart';
import 'package:social_media/core/widget/image/app_image_widget.dart';

import '../../../../../core/resource/app_color.dart';
import '../../../../../core/resource/app_size.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

class StoryList extends StatelessWidget {
  const StoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppWidth.w2, vertical: AppHeight.h1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.r40),
          color: AppColor.darkBlue,
          boxShadow: [
            BoxShadow(
                color: AppColor.grey,
                spreadRadius: 0,
                blurRadius: 9,
                offset: const Offset(0, 1))
          ]),
      child: SizedBox(
        height: AppHeight.h8,
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return StoryItem();
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: AppWidth.w2,
              );
            },
            itemCount: 5),
      ),
    );
  }
}

class StoryItem extends StatelessWidget {
  const StoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppWidth.w14,
      height: AppWidth.w14,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColor.white, width: 2)),
      child: const AppImageWidget(),
    );
  }
}
