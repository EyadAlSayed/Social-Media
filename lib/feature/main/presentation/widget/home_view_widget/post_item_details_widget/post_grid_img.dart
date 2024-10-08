import 'package:flutter/material.dart';
import 'package:social_media/core/resource/app_size.dart';
import 'package:social_media/core/widget/image/app_image_widget.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

class PostGridImage extends StatelessWidget {
  const PostGridImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.r20)),
          width: AppWidth.w42,
          height: AppHeight.h38,
          child: AppImageWidget(),
        ),
        SizedBox(
          width: AppWidth.w1Point5,
        ),
        Column(
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.r20)),
              width: AppWidth.w42,
              height: AppHeight.h18Point5,
              child: AppImageWidget(),
            ),
            SizedBox(
              height: AppHeight.h1,
            ),
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.r20)),
              width: AppWidth.w42,
              height: AppHeight.h18,
              child: AppImageWidget(),
            ),
          ],
        ),
      ],
    );
  }
}
