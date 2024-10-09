import 'package:flutter/material.dart';
import 'package:social_media/core/resource/app_size.dart';
import 'package:social_media/core/widget/image/app_image_widget.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

class PostGridImage extends StatelessWidget {
  const PostGridImage({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    if (images.length < 3) return SizedBox();
    return Row(
      children: [
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(AppPixel.p20)),
          width: AppWidth.w42,
          height: AppHeight.h38,
          child: AppImageWidget(
            imageUrl: images[0],
          ),
        ),
        SizedBox(
          width: AppWidth.w1point5,
        ),
        Column(
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppPixel.p20)),
              width: AppWidth.w42,
              height: AppHeight.h18point5,
              child: AppImageWidget(
                imageUrl: images[1],
              ),
            ),
            SizedBox(
              height: AppHeight.h1,
            ),
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppPixel.p20)),
              width: AppWidth.w42,
              height: AppHeight.h18,
              child: AppImageWidget(
                imageUrl: images[2],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
